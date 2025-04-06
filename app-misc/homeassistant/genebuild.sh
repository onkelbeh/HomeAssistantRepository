#!/bin/bash
######
# Author: Xavier FORESTIER
# Source: https://github.com/xavierforestier/HomeAssistantRepository
# Purpose: Generate gentoo ebuild for homeassistant
#          Parse files requirement_all.txt, package_constraints.txt, and use eix to search for mathcing gentoo package
######
eix-update

# get target version
if [ -z "$1" ];then
    VERSION=$( curl -s https://api.github.com/repos/home-assistant/core/releases/latest | jq '.tag_name' | xargs -I {} echo {} )
else
    VERSION=$( curl -s "https://api.github.com/repos/home-assistant/core/releases/tags/${1/_beta/b}" | jq '.tag_name' | xargs -I {} echo {} )
fi
EBUILD=$( pwd | rev | cut -d/ -f1 | rev )-${VERSION/b/_beta}
EBUILD_PATH=$( pwd )/$EBUILD.ebuild

######
# Parse a requirement.txt single entry and write it in ebuild as requirement
# $1 prefix (ex "\n\t", " ")
# $2 ebuild path
# $3 requirement to parse
# Ex1: "adb-shell[async]>=0.4.4" => ">=dev-python/adb-shell-0.4.4[async,${PYTHON_USEDEP}]"
# Ex2: "xmltodict==0.13.4" => "~dev-python/xmltodict-0.13.4[${PYTHON_USEDEP}]"
######
parse_package() {
  local l="$3"
  local OIFS="$IFS"
  local operator=
  local version=
  IFS='~<>=!['
  for d in $l; do
    echo -ne "\r                                                                                        \r \e[0;32m*\e[0m Parsing dependencies... $d"
    local pos=${#d}
    if [ "${l:$pos:1}" = "[" ]; then
      operator=$( echo "$l" | cut -d] -f2- )
      #TODO version can be coma separated adb-shell[async]>=0.4.4,<5, for now only handle first criteria
      version=$( echo "${operator:2}" | cut -d\; -f1 | cut -d, -f1 )
      operator=${operator:0:2}
    else
      operator=${l:$pos:2}
      pos=$((pos + 2 ))
      version=$( echo "${l:$pos}" | cut -d\; -f1 )
    fi
    local package
    package=$( eix -es# "$d" --use python_targets_python3_13 )
    if [ -z "$package" ];then
      package=$( eix -es# "${d,,}" --use python_targets_python3_13 )
    fi
    if [ -z "$package" ];then
      package=$( eix -es# "${d//_/-}" --use python_targets_python3_13 )
    fi
    if [ -z "$package" ];then
      package=$( eix -es# "${d//./-}" --use python_targets_python3_13 )
    fi
    case $d in
      atomicwrites-homeassistant)
        package="dev-python/atomicwrites"
	;;
      uv)
        echo -e "\n\t>=dev-python/uv-$version" >> "$2"
        break
        ;;
    esac
    if [ -z "$package" ];then
      echo -e ": \e[1;33m$l corresponding gentoo package was not found, entry skipped\e[0m                     "
      break
    fi
    #Write ebuild dep
    echo -ne "$1" >> "$2"
    if [ "$version" = "1000000000.0.0" ]; then
      echo -n "$package" >> "$2"
      break
    fi
    case $operator in
      ~= | ==)
        echo -n "~$package-$version" >> "$2"
	;;
      *)
        echo -n "$operator$package-$version" >> "$2"
    esac

    local dep_use
    dep_use=$( echo "$dep" | cut -sd[ -f2 | cut -sd] -f1 )
    if [ "$dep_use" = "" ]; then
      echo -n "[\${PYTHON_USEDEP}]" >> "$2"
    else
      echo -n "[$dep_use,\${PYTHON_USEDEP}]" >> "$2"
    fi
    break
  done
  IFS="$OIFS"
} #parse_package

######
# Parse package_constraints files for main dependencies
# $1 ebuild path
# $2 parse_constraints file
######
parse_constraints() {
  local f=$2
  echo "# Home Assistant Core dependencies from $f" >> "$1"
  echo "RDEPEND=\"\${RDEPEND}" >> "$1"
  while read -r l; do
    echo -ne "                                                                                          \r \e[0;32m*\e[0m Parsing main dependencies... $l"
    parse_package "\n\t" "$1" "$l"
  done < <( grep '^[^#]' "$f" | cut -d, -f1 | tr ' ' '\n' )
  echo "\"" >> "$1"
} #parse_constraints

######
# Parse requirment_all file and search dependencies for the given USE flag
# $1 ebuild_path
# $2 requirement_all.txt path
# $3 USE flag#
######
parse_use_flag_req() {
  local reqall=$2
  local use=$3
  local OLDIFS=$IFS
  IFS="
"
  echo -ne "                                                                                          \r \e[0;32m*\e[0m Parsing use flag dependencies... $use"
  found_dep=
  while read -r req; do
    local start_line
    start_line=$( echo "$req" | cut -d: -f1 )
    start_line=$(( start_line + 1 ))
    local found=
    for dep in $( tail -n+$start_line "$reqall" ); do
      if [ "${dep:0:1}" = "#" ]; then
        if [ "$found" = "" ]; then
          continue
        else
          break
        fi
      else
        if [ "$found_dep" = "" ]; then
          echo -ne "\t$use? (" >> "$1"
          found_dep="X"
        fi
        parse_package " " "$1" "$dep"
        found="X"
      fi
    done
  done < <( grep -n "^# homeassistant.components.$use$" "$reqall" )
  IFS=$OLDIFS

  if [ "$found_dep" = "" ]; then
    echo -e ": \e[0;31mno package found\e[0m                                     "
  else
    echo " )">> "$1"
  fi
} #parse_use_flag_req

if [ -f "$EBUILD_PATH" ]; then
    echo -e "  \e[0;31m$EBUILD already exists, \e[0m"
    ebuild "$EBUILD_PATH" clean unpack
else
    for v in $( ls -rv ./*.ebuild ); do
        cp "$v" "$EBUILD_PATH"
        break
    done
    ebuild "$EBUILD_PATH" clean digest unpack
    patch="$( pwd )/files/genebuild_${VERSION/b/_beta}.patch"
fi

pushd "/var/tmp/portage/app-misc/${EBUILD}/work" || exit

if [ -f "$patch" ]; then
    patch -p1 < "$patch"
fi

#gen metadata
popd || exit
echo "Generate metadata.xml..."
sed -z 's/<use>.*/<use>/g' < metadata.xml > metadata.xml.pre
mv metadata.xml.pre metadata.xml
for f in $( find "/var/tmp/portage/app-misc/${EBUILD}/work/core-${VERSION/b/_beta}/homeassistant/components" | grep manifest.json | sort ); do
  #component name
  use_flag=$( echo "$f"| rev | cut -d/ -f2 | rev )
  if grep -qn "^# homeassistant.components.${use_flag}$" "/var/tmp/portage/app-misc/${EBUILD}/work/core-${VERSION/b/_beta}/requirements_all.txt"; then
    #get help page
    if [ ! -f "/tmp/$use_flag.html" ]; then
      wget -q -O "/tmp/$use_flag.html" "https://www.home-assistant.io/integrations/$use_flag/index.html"
    fi
    if [ -s "/tmp/$use_flag.html" ]; then
      echo -ne "\r                                                                                          \r \e[0;32m*\e[0m Generate metadata.xml($use_flag)..."
      #parse description Ignore anything before '<div class="page-content">' then before '</header>' until '</p>', cleanup html and carriage return
      description=$( sed -z 's/.*<div class="page-content">//g' "/tmp/$use_flag.html" | sed -z 's/.*<\/header>//' | sed -z 's/<\/p>.*//' |sed -z 's/<span class="terminology-tooltip">.*<\/span>//g' | sed 's/<[^>]*>//g' | tr -d "\n" | xargs )
      echo -ne "\n    <flag name=\"$use_flag\">$description</flag>" >> metadata.xml
    fi
  fi
done
cat >> metadata.xml << EOF
  </use>
</pkgmetadata>
EOF

#Gen ebuild
cat > "$EBUILD_PATH" << EOF
# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..13} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="homeassistant"
inherit distutils-r1 pypi readme.gentoo-r1 systemd

MY_PN=homeassistant

if [[ \${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/home-assistant/core.git"
	EGIT_BRANCH="dev"
	S="\${WORKDIR}/homeassistant-full-9999/"
else
	MY_PV=\${PV/_beta/b}
	MY_P=\${MY_PN}-\${MY_PV}
	SRC_URI="\$(pypi_sdist_url homeassistant)
	https://github.com/home-assistant/core/archive/\${MY_PV}.tar.gz -> \${MY_P}.gh.tar.gz"
fi

DESCRIPTION="Open-source home automation platform running on Python."
HOMEPAGE="https://home-assistant.io/ https://git.edevau.net/onkelbeh/HomeAssistantRepository/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
EOF
echo -n "IUSE=\"bh1750 blinkt bme280 bme680 cli coronavirus deutsche_bahn dht http loopenergy mariadb mosquitto mysql smarthab socat somfy ssl systemd tesla wink " >> "$EBUILD_PATH"

grep "\<flag" "metadata.xml" | cut -d\" -f2 | while read -r u; do 
  echo -n " $u" >>"$EBUILD_PATH"
done
cat >> "$EBUILD_PATH"<<EOF
"
RESTRICT="!test? ( test )"

# external deps
RDEPEND="\${PYTHON_DEPS} acct-group/\${MY_PN} acct-user/\${MY_PN}
	|| ( dev-lang/python:3.12 dev-lang/python:3.13 )
	app-admin/logrotate
	dev-db/sqlite
	dev-libs/libfastjson
	dev-libs/xerces-c"
REQUIRED_USE="bluetooth? ( ruuvi_gateway shelly )
	homekit_controller? ( bluetooth )"
EOF
echo -e "\n \e[0;32m*\e[0m Parsing main dependencies..."
pushd "/var/tmp/portage/app-misc/${EBUILD}/work" || exit
parse_constraints "$EBUILD_PATH" "/var/tmp/portage/app-misc/${EBUILD}/work/core-${VERSION}/homeassistant/package_constraints.txt" 
echo -e "                                                                                          \r \e[0;32m*\e[0m Parsing main dependencies... \e[0;32mdone\e[0m                                    "
cat >> "$EBUILD_PATH" <<EOF

# unknown origin, still something to clean up here

RDEPEND="\${RDEPEND}
	~dev-python/colorlog-6.8.2[\${PYTHON_USEDEP}]
	~dev-python/pyotp-2.8.0[\${PYTHON_USEDEP}]
	>=dev-python/pyqrcode-1.2.1[\${PYTHON_USEDEP}]"

# Module requirements from useflags
RDEPEND="\${RDEPEND}
	bh1750? ( dev-python/i2csense[\${PYTHON_USEDEP}] )
	blinkt? ( ~dev-python/blinkt-0.1.0[\${PYTHON_USEDEP}] )
	bme280? ( dev-python/i2csense[\${PYTHON_USEDEP}] dev-python/bme280spi[\${PYTHON_USEDEP}] )
	bme680? ( dev-python/bme680[\${PYTHON_USEDEP}] )
	cli? ( app-misc/home-assistant-cli )
	coronavirus? ( dev-python/coronavirus[\${PYTHON_USEDEP}] )
	deutsche_bahn? ( dev-python/schiene[\${PYTHON_USEDEP}] )
	dht? ( ~dev-python/adafruit-circuitpython-dht-3.7.0[\${PYTHON_USEDEP}] ~dev-python/RPi-GPIO-0.7.1_alpha4[\${PYTHON_USEDEP}] )
	http? ( ~dev-python/aiohttp-cors-0.7.0[\${PYTHON_USEDEP}] ~dev-python/aiohttp-fast-url-dispatcher-0.3.0[\${PYTHON_USEDEP}] ~dev-python/aiohttp-zlib-ng-0.3.1[\${PYTHON_USEDEP}] )
	loopenergy? ( ~dev-python/pyloopenergy-0.2.1[\${PYTHON_USEDEP}] )
	mariadb? ( dev-python/mysqlclient[\${PYTHON_USEDEP}] )
	mosquitto? ( app-misc/mosquitto )
	mysql? ( dev-python/mysqlclient[\${PYTHON_USEDEP}] )
	smarthab? ( ~dev-python/SmartHab-0.21[\${PYTHON_USEDEP}] )
	socat? ( net-misc/socat )
	somfy? ( ~dev-python/pymfy-0.11.0[\${PYTHON_USEDEP}] )
	ssl? ( dev-libs/openssl app-crypt/certbot net-proxy/haproxy )
	tesla? ( ~dev-python/teslajsonpy-0.18.3[\${PYTHON_USEDEP}] )
	wink? ( ~dev-python/pubnubsub-handler-1.0.9[\${PYTHON_USEDEP}] ~dev-python/python-wink-1.10.5[\${PYTHON_USEDEP}] )
EOF
grep "IUSE=" "$EBUILD_PATH" | cut -d\" -f2 | tr ' ' '\n' | while read -r use; do
  parse_use_flag_req "$EBUILD_PATH" "/var/tmp/portage/app-misc/${EBUILD}/work/core-${VERSION/b/_beta}/requirements_all.txt" "${use/+/}"
done
echo "\"" >> "$EBUILD_PATH"
echo -e "                                                                                          \r \e[0;32m*\e[0m Parsing use flag dependencies... \e[0;32mdone\e[0m                        "
cat >> "$EBUILD_PATH" <<EOF

BDEPEND="\${RDEPEND}
	test? (
		dev-python/astroid[\${PYTHON_USEDEP}]
		dev-python/coverage[\${PYTHON_USEDEP}]
		dev-python/freezegun[\${PYTHON_USEDEP}]
		dev-python/mock-open[\${PYTHON_USEDEP}]
		dev-python/mypy-dev[\${PYTHON_USEDEP}]
		dev-python/pipdeptree[\${PYTHON_USEDEP}]
		dev-vcs/pre-commit
		dev-python/pylint-per-file-ignores[\${PYTHON_USEDEP}]
		dev-python/pylint[\${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[\${PYTHON_USEDEP}]
		dev-python/pytest-cov[\${PYTHON_USEDEP}]
		dev-python/pytest-freezer[\${PYTHON_USEDEP}]
		dev-python/pytest-github-actions-annotate-failures[\${PYTHON_USEDEP}]
		dev-python/pytest-picked[\${PYTHON_USEDEP}]
		dev-python/pytest-socket[\${PYTHON_USEDEP}]
		dev-python/pytest-sugar[\${PYTHON_USEDEP}]
		dev-python/pytest-timeout[\${PYTHON_USEDEP}]
		dev-python/pytest-unordered[\${PYTHON_USEDEP}]
		dev-python/pytest-xdist[\${PYTHON_USEDEP}]
		dev-python/pytest[\${PYTHON_USEDEP}]
		dev-python/requests-mock[\${PYTHON_USEDEP}]
		dev-python/respx[\${PYTHON_USEDEP}]
		dev-python/syrupy[\${PYTHON_USEDEP}]
		dev-python/tqdm[\${PYTHON_USEDEP}]
	)
	dev-python/setuptools[\${PYTHON_USEDEP}]
	dev-python/mock[\${PYTHON_USEDEP}]"

src_prepare() {
	if use test ; then
		cp --no-preserve=mode --recursive "\${WORKDIR}/core-\${MY_PV}/tests" "\${S}"
		chmod u+x "\${S}/tests/auth/providers/test_command_line_cmd.sh"
	fi
	sed -E -i "s/regex==[^ ]*/regex/g" -i "homeassistant/package_constraints.txt" || die

	distutils-r1_src_prepare
}
INSTALL_DIR="/opt/\${MY_PN}"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
The HA interface listens on port 8123
hass configuration is in: /etc/\${MY_PN}
daemon command line arguments are configured in: /etc/conf.d/\${MY_PN}
logging is to: /var/log/\${MY_PN}/{server,errors,stdout}.log
The sqlite db is by default in: /etc/\${MY_PN}
support at https://git.edevau.net/onkelbeh/HomeAssistantRepository
"

DOCS="README.rst"

python_install_all() {
	dodoc \${DOCS}
	distutils-r1_python_install_all
	keepdir "\$INSTALL_DIR"
	keepdir "/etc/\${MY_PN}"
	fowners -R "\${MY_PN}:\${MY_PN}" "/etc/\${MY_PN}"
	keepdir "/var/log/\${MY_PN}"
	fowners -R "\${MY_PN}:\${MY_PN}" "/var/log/\${MY_PN}"
	newconfd "\${FILESDIR}/\${MY_PN}.conf.d" "\${MY_PN}"
	newinitd "\${FILESDIR}/\${MY_PN}.init.d" "\${MY_PN}"
	use systemd && systemd_dounit "\${FILESDIR}/\${MY_PN}.service"
	dobin "\${FILESDIR}/hasstest"
	if use socat ; then
		newinitd "\${FILESDIR}/socat-zwave.init.d" "socat-zwave"
		sed -i -e 's/# need socat-zwave/need socat-zwave/g' "\${D}/etc/init.d/\${MY_PN}" || die
	fi
	if use mqtt ; then
		sed -i -e 's/# need mosquitto/need mosquitto/g' "\${D}/etc/init.d/\${MY_PN}" || die
	fi
	insinto /etc/logrotate.d
	newins "\${FILESDIR}/\${MY_PN}.logrotate" "\${MY_PN}"
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}

distutils_enable_tests pytest
EOF

popd || exit
ebuild "$EBUILD_PATH" clean digest

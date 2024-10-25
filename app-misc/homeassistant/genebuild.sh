#!/bin/bash


parse_constraints () {
    local f="$1"
    echo "# Home Assistant Core dependencies from $f" >> $EBUILD_PATH
    echo "RDEPEND=\"${RDEPEND}" >> $EBUILD_PATH
    for l in `cat $f | grep '^[^#]' | cut -d, -f1`; do
        OIFS="$IFS"
        IFS='<>=!'
        for d in  $l; do
	    echo -ne "                                                                                          \r \e[0;32m*\e[0m Parsing main dependencies... $d"
	    local pos=${#d}
	    local package=`eix -es# $d  --use python_targets_python3_12`
            local operator=${l:$pos:2}
            pos=$((pos + 2 ))
            local version=${l:$pos}
            if [ -z "$package" ];then
	    	package=`eix -es# ${d,,}  --use python_targets_python3_12`
	    fi
            if [ -z "$package" ];then
                package=`eix -es# ${d//_/-}  --use python_targets_python3_12`
            fi
	    case $d in
	    	atomicwrites-homeassistant)
	    		package="dev-python/atomicwrites"
			;;
		faust-cchardet)
	                package="dev-python/cchardet"
			;;
		uv)
	                echo "	>=dev-python/uv-$version" >> $EBUILD_PATH
			break
			;;
		protobuf)
			package="dev-python/protobuf-python"
			;;
	        Jinja2)
	                package="dev-python/jinja"
			;;
	    esac
	    if [ -z "$package" ];then
	      echo -e ": \e[1;33m$l corresponding gentoo package was not found, entry skipped\e[0m"
	      break
	    fi
	    if [ "$version" = "1000000000.0.0" ]; then
	    	echo "        $package[\${PYTHON_USEDEP}]" >> $EBUILD_PATH
	        break
	    fi
	    case $operator in
	    	==)
                  echo "	~$package-$version[\${PYTHON_USEDEP}]" >> $EBUILD_PATH
		  ;;
		*)
		  echo "	$operator$package-$version[\${PYTHON_USEDEP}]" >> $EBUILD_PATH
            esac
            break
        done
        IFS="$OIFS"
    done
    echo "\"" >> $EBUILD_PATH

}

# get latest
if [ -z "$1" ];then
    VERSION=`curl -s https://api.github.com/repos/home-assistant/core/releases/latest | jq '.tag_name' | xargs -I {} echo {}`
else
    VERSION=`curl -s https://api.github.com/repos/home-assistant/core/releases/tags/${1/_beta/b} | jq '.tag_name' | xargs -I {} echo {}`
fi
EBUILD=$( pwd | rev | cut -d/ -f1 | rev )-${VERSION/b/_beta}
EBUILD_PATH=$( pwd )/$EBUILD.ebuild

if [ -f "$EBUILD_PATH" ]; then
    echo -e "  \e[0;31m$EBUILD already exists, \e[0m"
    ebuild $EBUILD_PATH clean unpack
else
    for v in `ls -rv *.ebuild`; do
        cp $v $EBUILD_PATH
        break
    done
    ebuild $EBUILD_PATH clean digest unpack
    patch=$( pwd )/files/genebuild_${VERSION/b/_beta}.patch

fi

pushd /var/tmp/portage/app-misc/homeassistant-${VERSION/b/_beta}/work

if [ -f "$patch" ]; then
    patch -p1 < $patch
fi

cat > $EBUILD_PATH << EOF
# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_12 )
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
	SRC_URI="\$(pypi_sdist_url)
	https://github.com/home-assistant/core/archive/\${MY_PV}.tar.gz -> \${MY_P}.gh.tar.gz"
fi

DESCRIPTION="Open-source home automation platform running on Python."
HOMEPAGE="https://home-assistant.io/ https://git.edevau.net/onkelbeh/HomeAssistantRepository/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="abode accuweather acer_projector acmeda adguard ads aftership agent_dvr airly airvisual alarmdecoder alpha_vantage ambiclimate ambient_station amcrest ampio analytics_insights androidtv androidtv_remote android_ip_webcam anthemav apache_kafka apcupsd apple_tv apprise aquostv arcam_fmj aruba asuswrt aten_pe atome august aurora_abb_powerone avea avion awair axis +backup baidu beewi_smartclim bh1750 bitcoin bizkaibus blackbird blebox blink blinksticklight blinkt blockchain +bluetooth bluetooth_tracker bme280 bme680 bmw_connected_drive bond braviatv bring broadlink brottsplatskartan brunt bsblan bt_home_hub_5 bt_smarthub buienradar +caldav camera canary cast cisco_mobility_express cli co2signal compensation coronavirus daikin deconz delijn denonavr deutsche_bahn devolo_home_control dexcom dhcp dht discogs discord discovery dlna_dmr dlna_dms doorbird dunehd dwd_weather_warnings dynalite dyson ecobee ecowitt emulated_roku enigma2 enocean enphase_envoy environment_canada esphome everlights evohome ffmpeg fibaro file flume flunearyou flux_led foobot forecast_solar fortios freebox fritz fritzbox fritzbox_callmonitor fronius garmin_connect gios github glances gogogate2 greeneye_monitor growatt_server guardian harman_kardon_avr harmony heos here_travel_time holiday +homekit homekit_controller homematic homematicip_cloud hp_ilo http hue hydrawise iaqualink ibeacon ihc image_upload imap incomfort influxdb insteon intesishome ipma ipp isal islamic_prayer_times jewish_calendar joaoapps_join kef knx kodi kraken lifx linode litterrobot local_calendar local_todo loopenergy luci luftdaten +mariadb +matter maxcube media_extractor met meteo_france mfi mikrotik +mobile_app modbus +mosquitto +mqtt mysql nad nederlandse_spoorwegen netatmo netdata nextcloud nfandroidtv nmap_tracker +notify_events nuki nut nws nx584 octoprint onkyo onvif opengarage opensensemap openweathermap opnsense +otp owntracks panasonic_viera philips_js pilight +ping pi_hole +plex plugwise poolsense powerwall ps4 +python_script qnap qvr_pro rachio radio_browser rainbird rainmachine +recorder rejseplanen +rest ring roku roomba roon ruuvi_gateway samsungtv +scrape season shelly shodan signal_messenger simplisafe skybell sma smappee smarthab smartthings +snmp socat solax somfy sonos speedtestdotnet +spotify +sql squeezebox +ssl statsd synology_dsm systemd systemmonitor tankerkoenig tasmota tellduslive tesla test tile tomorrowio toon totalconnect tplink tts tuya unifi unifi_direct +upnp usb utility_meter vallox velbus velux vera +version vicare vizio +wake_on_lan waqi waze_travel_time webostv wemo whois wink withings wled workday xbox_live xiaomi_aqara xiaomi_miio xiaomi_tv xs1 yamaha yamaha_musiccast yeelight yi zeroconf zerproc zha zhong_hong zoneminder zwave_js"
RESTRICT="!test? ( test )"

# external deps
RDEPEND="\${PYTHON_DEPS} acct-group/\${MY_PN} acct-user/\${MY_PN}
	|| ( dev-lang/python:3.12 dev-lang/python:3.13 )
	app-admin/logrotate
	dev-db/sqlite
	dev-libs/libfastjson
	dev-libs/xerces-c"
# make sure no conflicting main Ebuild is installed
RDEPEND="\${RDEPEND}
	!app-misc/homeassistant-min
	!app-misc/homeassistant-full"
REQUIRED_USE="bluetooth? ( ruuvi_gateway shelly )
	homekit_controller? ( bluetooth )"

EOF
echo -ne " \e[0;32m*\e[0m Parsing main dependencies..."
for i in `find . | grep package_constraints`;do parse_constraints $i; done
echo -e "                                                                                          \r \e[0;32m*\e[0m Parsing main dependencies... \e[0;32mdone\e[0m                                    "
cat >> $EBUILD_PATH <<EOF

# unknown origin, still something to clean up here

RDEPEND="\${RDEPEND}
	~dev-python/colorlog-6.8.2[\${PYTHON_USEDEP}]
	~dev-python/pyotp-2.8.0[\${PYTHON_USEDEP}]
	>=dev-python/pyqrcode-1.2.1[\${PYTHON_USEDEP}]"

# Module requirements from useflags
RDEPEND="\${RDEPEND}
	ambiclimate? ( dev-python/Ambiclimate[\${PYTHON_USEDEP}] )
	bh1750? ( dev-python/i2csense[\${PYTHON_USEDEP}] )
	blinksticklight? ( ~dev-python/BlinkStick-1.2.0[\${PYTHON_USEDEP}] )
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
reqall=""
for i in `find ./ | grep requirements_all.txt`; do reqall=$i; break; done
for use in `cat $EBUILD_PATH | grep IUSE= | cut -d\" -f2`; do
    use=${use/+/}
    OLDIFS=$IFS
        IFS="
"
    echo -ne "                                                                                          \r \e[0;32m*\e[0m Parsing use flag dependencies... $use"
    found_dep=
    for req in `cat $reqall | grep -n "^# homeassistant.components.$use$"`; do
    	start_line=`echo $req | cut -d: -f1`
    	start_line=$(( start_line + 1 ))
	found=
	for dep in `tail -n+$start_line $reqall`; do
	    if [ "${dep:0:1}" = "#" ]; then
	        if [ "$found" = "" ]; then
		    continue
		else
        	    break
		fi
            else
		if [ "$found_dep" = "" ]; then
		    echo -n "	$use? (" >> $EBUILD_PATH
		    found_dep="X"
		fi
		dep_package=`eix -es# $( echo "${dep/./-}" | cut -d= -f 1 | cut -d[ -f 1 )  --use python_targets_python3_12`
		if [ -z "$dep_package" ];then
                    dep_package=`eix -es# $( echo "${dep,,}" | cut -d= -f 1 | cut -d[ -f 1 )  --use python_targets_python3_12`
		fi
		if [ -z "$dep_package" ];then		
                    dep_package=`eix -es# $( echo "${dep//_/-}" | cut -d= -f 1 | cut -d[ -f 1 )  --use python_targets_python3_12`
                fi
		if [ -z "$dep_package" ];then           
		    echo "$req, $dep => $dep_package error"
		fi

		dep_version=`echo "$dep" | cut -d= -f 3`
		dep_use=`echo "$dep" | cut -sd[ -f2 | cut -sd] -f1`
		if [ "$dep_use" = "" ]; then
		    echo -n " ~$dep_package-$dep_version[\${PYTHON_USEDEP}]" >> $EBUILD_PATH 	
		else
  	            echo -n " ~$dep_package-$dep_version[$dep_use,\${PYTHON_USEDEP}]" >> $EBUILD_PATH
		fi
                found="X"
	    fi
        done
    done
    IFS=$OLDIFS
    if [ "$found_dep" = "" ]; then
    	echo -e ": \e[0;31mno package found\e[0m"
    else
        echo " )">> $EBUILD_PATH
    fi
done
echo "\"" >> $EBUILD_PATH
echo -e "                                                                                          \r \e[0;32m*\e[0m Parsing use flag dependencies... \e[0;32mdone\e[0m                        "
cat >> $EBUILD_PATH <<EOF

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
        cp --no-preserve=mode --recursive \${WORKDIR}/core-\${MY_PV}/tests \${S}
		chmod u+x \${S}/tests/auth/providers/test_command_line_cmd.sh
    fi
    sed -E -i "s/regex==[^ ]*/regex/g" -i homeassistant/package_constraints.txt || die

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

popd
ebuild $EBUILD_PATH clean digest

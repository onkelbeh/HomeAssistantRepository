# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..13} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="homeassistant"
inherit distutils-r1 pypi readme.gentoo-r1 systemd

MY_PN=homeassistant

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/home-assistant/core.git"
	EGIT_BRANCH="dev"
	S="${WORKDIR}/homeassistant-full-9999/"
else
	MY_PV=${PV/_beta/b}
	MY_P=${MY_PN}-${MY_PV}
	SRC_URI="$(pypi_sdist_url homeassistant)
	https://github.com/home-assistant/core/archive/${MY_PV}.tar.gz -> ${MY_P}.gh.tar.gz"
fi

DESCRIPTION="Open-source home automation platform running on Python."
HOMEPAGE="https://home-assistant.io/ https://git.edevau.net/onkelbeh/HomeAssistantRepository/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="bh1750 blinkt bme280 bme680 cli coronavirus deutsche_bahn dht loopenergy mariadb mosquitto mysql smarthab socat ssl systemd tesla wink
"
RESTRICT="!test? ( test )"

# external deps
RDEPEND="${PYTHON_DEPS} acct-group/${MY_PN} acct-user/${MY_PN}
	|| ( dev-lang/python:3.12 dev-lang/python:3.13 )
	app-admin/logrotate
	dev-db/sqlite
	dev-libs/libfastjson
	dev-libs/xerces-c"
# make sure no conflicting main Ebuild is installed
RDEPEND="${RDEPEND}
	!app-misc/homeassistant-min
	!app-misc/homeassistant"
REQUIRED_USE="bluetooth? ( ruuvi_gateway shelly )
	homekit_controller? ( bluetooth )"

# unknown origin, still something to clean up here

RDEPEND="${RDEPEND}
	~dev-python/colorlog-6.8.2[${PYTHON_USEDEP}]
	~dev-python/pyotp-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}]"

# Module requirements from useflags
RDEPEND="${RDEPEND}
	bh1750? ( dev-python/i2csense[${PYTHON_USEDEP}] )
	blinksticklight? ( ~dev-python/BlinkStick-1.2.0[${PYTHON_USEDEP}] )
	blinkt? ( ~dev-python/blinkt-0.1.0[${PYTHON_USEDEP}] )
	bme280? ( dev-python/i2csense[${PYTHON_USEDEP}] dev-python/bme280spi[${PYTHON_USEDEP}] )
	bme680? ( dev-python/bme680[${PYTHON_USEDEP}] )
	cli? ( app-misc/home-assistant-cli )
	coronavirus? ( dev-python/coronavirus[${PYTHON_USEDEP}] )
	deutsche_bahn? ( dev-python/schiene[${PYTHON_USEDEP}] )
	dht? ( ~dev-python/adafruit-circuitpython-dht-3.7.0[${PYTHON_USEDEP}] ~dev-python/RPi-GPIO-0.7.1_alpha4[${PYTHON_USEDEP}] )
	http? ( ~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}] ~dev-python/aiohttp-fast-url-dispatcher-0.3.0[${PYTHON_USEDEP}] ~dev-python/aiohttp-zlib-ng-0.3.1[${PYTHON_USEDEP}] )
	loopenergy? ( ~dev-python/pyloopenergy-0.2.1[${PYTHON_USEDEP}] )
	mariadb? ( dev-python/mysqlclient[${PYTHON_USEDEP}] )
	mosquitto? ( app-misc/mosquitto )
	mysql? ( dev-python/mysqlclient[${PYTHON_USEDEP}] )
	smarthab? ( ~dev-python/SmartHab-0.21[${PYTHON_USEDEP}] )
	socat? ( net-misc/socat )
	somfy? ( ~dev-python/pymfy-0.11.0[${PYTHON_USEDEP}] )
	ssl? ( dev-libs/openssl app-crypt/certbot net-proxy/haproxy )
	tesla? ( ~dev-python/teslajsonpy-0.18.3[${PYTHON_USEDEP}] )
	wink? ( ~dev-python/pubnubsub-handler-1.0.9[${PYTHON_USEDEP}] ~dev-python/python-wink-1.10.5[${PYTHON_USEDEP}] )
"

BDEPEND="${RDEPEND}
	test? (
		dev-python/astroid[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/freezegun[${PYTHON_USEDEP}]
		dev-python/mock-open[${PYTHON_USEDEP}]
		dev-python/mypy-dev[${PYTHON_USEDEP}]
		dev-python/pipdeptree[${PYTHON_USEDEP}]
		dev-vcs/pre-commit
		dev-python/pylint-per-file-ignores[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-freezer[${PYTHON_USEDEP}]
		dev-python/pytest-github-actions-annotate-failures[${PYTHON_USEDEP}]
		dev-python/pytest-picked[${PYTHON_USEDEP}]
		dev-python/pytest-socket[${PYTHON_USEDEP}]
		dev-python/pytest-sugar[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-unordered[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
		dev-python/respx[${PYTHON_USEDEP}]
		dev-python/syrupy[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
	)
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]"

src_prepare() {
    if use test ; then
        cp --no-preserve=mode --recursive ${WORKDIR}/core-${MY_PV}/tests ${S}
		chmod u+x ${S}/tests/auth/providers/test_command_line_cmd.sh
    fi
    sed -E -i "s/regex==[^ ]*/regex/g" -i homeassistant/package_constraints.txt || die

    distutils-r1_src_prepare
}
INSTALL_DIR="/opt/${MY_PN}"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
The HA interface listens on port 8123
hass configuration is in: /etc/${MY_PN}
daemon command line arguments are configured in: /etc/conf.d/${MY_PN}
logging is to: /var/log/${MY_PN}/{server,errors,stdout}.log
The sqlite db is by default in: /etc/${MY_PN}
support at https://git.edevau.net/onkelbeh/HomeAssistantRepository
"

DOCS="README.rst"

python_install_all() {
	dodoc ${DOCS}
	distutils-r1_python_install_all
	keepdir "$INSTALL_DIR"
	keepdir "/etc/${MY_PN}"
	fowners -R "${MY_PN}:${MY_PN}" "/etc/${MY_PN}"
	keepdir "/var/log/${MY_PN}"
	fowners -R "${MY_PN}:${MY_PN}" "/var/log/${MY_PN}"
	newconfd "${FILESDIR}/${MY_PN}.conf.d" "${MY_PN}"
	newinitd "${FILESDIR}/${MY_PN}.init.d" "${MY_PN}"
	use systemd && systemd_dounit "${FILESDIR}/${MY_PN}.service"
	dobin "${FILESDIR}/hasstest"
	if use socat ; then
		newinitd "${FILESDIR}/socat-zwave.init.d" "socat-zwave"
		sed -i -e 's/# need socat-zwave/need socat-zwave/g' "${D}/etc/init.d/${MY_PN}" || die
	fi
	if use mqtt ; then
		sed -i -e 's/# need mosquitto/need mosquitto/g' "${D}/etc/init.d/${MY_PN}" || die
	fi
	insinto /etc/logrotate.d
	newins "${FILESDIR}/${MY_PN}.logrotate" "${MY_PN}"
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}

distutils_enable_tests pytest

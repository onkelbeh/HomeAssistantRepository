# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7} )

inherit user readme.gentoo-r1 eutils distutils-r1

MY_P=${P/_beta/b}
MY_PV=${PV/_beta/b}

DESCRIPTION="Open-source home automation platform running on Python 3.6"
HOMEPAGE="https://home-assistant.io https://git.edevau.net/onkelbeh/HomeAssistantRepository"
SRC_URI="https://github.com/home-assistant/home-assistant/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="asuswrt atv firetv +frontend homematic hs100 maxcube musiccast mysql qnap rxv samsungtv sonos ssl tradfri wemo"

DEPEND="${PYTHON_DEPS}
	!app-misc/homeassistant-bin
	dev-db/sqlite
	dev-libs/libfastjson
	>=dev-libs/xerces-c-3.1.4-r1
	>=dev-libs/xml-security-c-1.7.3
	=dev-python/aiohttp-3.5.4[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	=dev-python/astral-1.8[${PYTHON_USEDEP}]
	=dev-python/async_timeout-3.0.1[${PYTHON_USEDEP}]
	=dev-python/attrs-18.2.0[${PYTHON_USEDEP}]
	=dev-python/bcrypt-3.1.5[${PYTHON_USEDEP}]
	=dev-python/beautifulsoup-4.7.1[${PYTHON_USEDEP}]
	>=dev-python/boto3-1.9.57[${PYTHON_USEDEP}]
	>=dev-python/botocore-1.12.57[${PYTHON_USEDEP}]
	=dev-python/caldav-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/cdu-0.1.3[${PYTHON_USEDEP}]
	>=dev-python/certifi-2018.11.29[${PYTHON_USEDEP}]
	>=dev-python/chardet-3.0.4[${PYTHON_USEDEP}]
	=dev-python/colorlog-4.0.2[${PYTHON_USEDEP}]
	>=dev-python/coverage-4.5.2[${PYTHON_USEDEP}]
	=dev-python/cryptography-2.3.1[${PYTHON_USEDEP}]
	>=dev-python/distro-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/docutils-0.14[${PYTHON_USEDEP}]
	>=dev-python/ecdsa-0.13[${PYTHON_USEDEP}]
	>=dev-python/envs-1.2.6[${PYTHON_USEDEP}]
	>=dev-python/future-0.17.1[${PYTHON_USEDEP}]
	=dev-python/gTTS-token-1.1.3[${PYTHON_USEDEP}]
	>=dev-python/idna-2.8[${PYTHON_USEDEP}]
	>=dev-python/idna-ssl-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/ifaddr-0.1.6[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.10[${PYTHON_USEDEP}]
	>=dev-python/jose-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/jsonrpc-async-0.6[${PYTHON_USEDEP}]
	=dev-python/jsonrpc-base-1.0[${PYTHON_USEDEP}]
	=dev-python/jsonrpc-websocket-0.6[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.2.5[${PYTHON_USEDEP}]
	>=dev-python/multidict-4.5.2[${PYTHON_USEDEP}]
	>=dev-python/netdisco-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/nose-1.3.7[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.15.4[${PYTHON_USEDEP}]
	>=dev-python/paho-mqtt-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/pip-8.0.3-r1[${PYTHON_USEDEP}]
	=dev-python/pillow-5.4.1[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.4.8[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.7.2[${PYTHON_USEDEP}]
	=dev-python/pyjwt-1.6.4[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.2.6-r1[${PYTHON_USEDEP}]
	>=dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}]
	=dev-python/pysnmp-4.4.8[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.7.5[${PYTHON_USEDEP}]
	>=dev-python/python-jose-cryptodome-1.3.2[${PYTHON_USEDEP}]
	=dev-python/python-slugify-1.2.6[${PYTHON_USEDEP}]
	>=dev-python/pytz-2018.07[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.13[${PYTHON_USEDEP}]
	=dev-python/requests-2.21.0-r1[${PYTHON_USEDEP}]
	=dev-python/RestrictedPython-4.0_beta_pre7[${PYTHON_USEDEP}]
	=dev-python/ruamel-yaml-0.15.85[${PYTHON_USEDEP}]
	=dev-python/setuptools-40.6.3[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.2.15[${PYTHON_USEDEP}]
	>=dev-python/typing-3.6.4-r1[${PYTHON_USEDEP}]
	>=dev-python/ua-parser-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.24.1[${PYTHON_USEDEP}]
	>=dev-python/user-agents-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/vobject-0.9.6.1[${PYTHON_USEDEP}]
	=dev-python/voluptuous-0.11.5[${PYTHON_USEDEP}]
	=dev-python/voluptuous-serialize-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/wakeonlan-1.1.6[${PYTHON_USEDEP}]
	=dev-python/warrant-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.48.0[${PYTHON_USEDEP}]
	>=dev-python/xmltodict-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.21.3[${PYTHON_USEDEP}]
	>=media-libs/mutagen-1.42.0
	atv? ( >=dev-python/pyatv-0.3.12[${PYTHON_USEDEP}] )
	firetv? ( =dev-python/firetv-1.0.7[${PYTHON_USEDEP}] )
	hs100? ( >=dev-python/pyHS100-0.3.0[${PYTHON_USEDEP}] )
	maxcube? ( =dev-python/maxcube-api-0.1.0[${PYTHON_USEDEP}] )
	musiccast? ( >=dev-python/pymusiccast-0.1.6[${PYTHON_USEDEP}] )
	mysql? ( dev-python/mysqlclient[${PYTHON_USEDEP}] )
	rxv? ( =dev-python/rxv-0.5.1[${PYTHON_USEDEP}] )
	samsungtv? ( >=dev-python/samsungctl-0.7.1[${PYTHON_USEDEP}] )
	sonos? ( >=dev-python/pysonos-0.0.6[${PYTHON_USEDEP}] )
	ssl? ( 	dev-libs/openssl:0
			app-crypt/certbot
			net-proxy/haproxy )
	tradfri? ( >=dev-python/pytradfri-6.0.1[${PYTHON_USEDEP}]
		 sys-devel/autoconf:2.69 )
	wemo? ( >=dev-python/pywemo-0.4.38[${PYTHON_USEDEP}] )
	frontend? ( =app-misc/home-assistant-frontend-20190130.1 )
	homematic? ( dev-python/pyhomematic[${PYTHON_USEDEP}] )
	asuswrt? ( dev-python/aioasuswrt[${PYTHON_USEDEP}] )
	qnap? ( dev-python/qnapstats[${PYTHON_USEDEP}] )
"

RDEPEND="${DEPEND}
	app-admin/logrotate
"

INSTALL_DIR="/opt/${PN}"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
The HA interface listens on port 8123
hass configuration is in: /etc/${PN}
daemon command line arguments are configured in: /etc/conf.d/${PN}
logging is to: /var/log/${PN}/{server,errors,stdout}.log
The sqlite db is by default in: /etc/${PN}
support at https://git.edevau.net/onkelbeh/HomeAssistantRepository
"

S="${WORKDIR}/home-assistant-${MY_PV}"

DOCS="README.rst"

pkg_setup() {
	enewgroup "${PN}"
	enewuser "${PN}" -1 -1 "$INSTALL_DIR" "${PN}"
}

src_prepare() {
	sed -e 's;astral==1.5;astral>=1.5;' \
		-i "setup.py" \
		-i homeassistant/package_constraints.txt

	eapply_user
}

python_install_all() {
	dodoc ${DOCS}
	distutils-r1_python_install_all

	keepdir "$INSTALL_DIR"

	keepdir "/etc/${PN}"
	fowners -R "${PN}:${PN}" "/etc/${PN}"

	keepdir "/var/log/${PN}"
	fowners -R "${PN}:${PN}" "/var/log/${PN}"

	newconfd "${FILESDIR}/${PN}.conf.d" "${PN}"
	newinitd "${FILESDIR}/${PN}.init.d" "${PN}"

	insinto /etc/logrotate.d
	newins "${FILESDIR}/${PN}.logrotate" "${PN}"

	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}

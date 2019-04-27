# Copyright 1999-2019 Gentoo Authors Andreas Billmeier b (at) edevau.net
# Distributed under the terms of the GNU General Public License v3.0

EAPI="7"

PYTHON_COMPAT=( python3_{6,7} )

inherit user readme.gentoo-r1 eutils distutils-r1

MY_P=${P/_beta/b}
MY_PV=${PV/_beta/b}

DESCRIPTION="Open-source home automation platform running on Python 3.6"
HOMEPAGE="https://home-assistant.io https://git.edevau.net/onkelbeh/HomeAssistantRepository"
SRC_URI="https://github.com/home-assistant/home-assistant/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
RESTRICT="mirror"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="androidtv asuswrt atv denonavr esphome enigma +frontend homematic hs100 maxcube musiccast mysql mqtt qnap rxv samsungtv sonos ssl speedtest test tradfri wemo zoneminder"

RDEPEND="${PYTHON_DEPS}
	!app-misc/homeassistant-bin
	app-admin/logrotate
	dev-db/sqlite
	dev-libs/libfastjson
	>=dev-libs/xerces-c-3.1.4-r1
	>=dev-libs/xml-security-c-1.7.3
	~dev-python/aiohttp-3.5.4[${PYTHON_USEDEP}]
	~dev-python/astral-1.10.1[${PYTHON_USEDEP}]
	~dev-python/async_timeout-3.0.1[${PYTHON_USEDEP}]
	~dev-python/attrs-18.2.0[${PYTHON_USEDEP}]
	~dev-python/bcrypt-3.1.6[${PYTHON_USEDEP}]
	>=dev-python/certifi-2019.3.9[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.10[${PYTHON_USEDEP}]
	~dev-python/pyjwt-1.7.1[${PYTHON_USEDEP}]
	~dev-python/cryptography-2.6.1[${PYTHON_USEDEP}]
	~dev-python/passlib-1.7.1-r1[${PYTHON_USEDEP}]
	>=dev-python/pip-8.0.3-r1[${PYTHON_USEDEP}]
	~dev-python/python-slugify-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/pytz-2018.9[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.13[${PYTHON_USEDEP}]
	<dev-python/pyyaml-4[${PYTHON_USEDEP}]
	=dev-python/requests-2.21.0-r1[${PYTHON_USEDEP}]
	~dev-python/ruamel-yaml-0.15.91[${PYTHON_USEDEP}]
	~dev-python/voluptuous-0.11.5[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.1.0[${PYTHON_USEDEP}]

	>=app-crypt/acme-0.32.0[${PYTHON_USEDEP}]
	>=dev-python/asn1crypto-0.24.0[${PYTHON_USEDEP}]
	~dev-python/cffi-1.12.2[${PYTHON_USEDEP}]
	>=dev-python/jmespath-0.9.4[${PYTHON_USEDEP}]
	>=dev-python/pycparser-2.19[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-19.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/pbr-5.1.3[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.9.1[${PYTHON_USEDEP}]
	>=dev-python/six-1.12.0[${PYTHON_USEDEP}]
	~dev-python/snitun-0.15[${PYTHON_USEDEP}]
	>=dev-python/pyrfc3339-1.1[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.11[${PYTHON_USEDEP}]

	>=dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	~dev-python/beautifulsoup-4.6.3[${PYTHON_USEDEP}]
	~dev-python/blinkpy-0.13.1[${PYTHON_USEDEP}]
	>=dev-python/boto3-1.9.116[${PYTHON_USEDEP}]
	>=dev-python/botocore-1.12.115[${PYTHON_USEDEP}]
	~dev-python/caldav-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/cdu-0.1.3[${PYTHON_USEDEP}]
	>=dev-python/chardet-3.0.4[${PYTHON_USEDEP}]
	~dev-python/colorlog-4.0.2[${PYTHON_USEDEP}]
	>=dev-python/coverage-4.5.2[${PYTHON_USEDEP}]
	>=dev-python/distro-1.4.0[${PYTHON_USEDEP}]
	~dev-python/docopt-0.6.2[${PYTHON_USEDEP}]
	>=dev-python/docutils-0.14[${PYTHON_USEDEP}]
	>=dev-python/ecdsa-0.13[${PYTHON_USEDEP}]
	>=dev-python/envs-1.3[${PYTHON_USEDEP}]
	>=dev-python/future-0.17.1[${PYTHON_USEDEP}]
	~dev-python/gTTS-token-1.1.3[${PYTHON_USEDEP}]
	>=dev-python/idna-2.8[${PYTHON_USEDEP}]
	>=dev-python/idna-ssl-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/ifaddr-0.1.6[${PYTHON_USEDEP}]
	>=dev-python/jose-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/jsonrpc-async-0.6[${PYTHON_USEDEP}]
	~dev-python/jsonrpc-base-1.0[${PYTHON_USEDEP}]
	~dev-python/jsonrpc-websocket-0.6[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.3.3[${PYTHON_USEDEP}]
	>=dev-python/multidict-4.5.2[${PYTHON_USEDEP}]
	>=dev-python/netdisco-2.6.0[${PYTHON_USEDEP}]
	>=dev-python/nose-1.3.7[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.16.2[${PYTHON_USEDEP}]
	>=dev-python/paho-mqtt-1.4.0[${PYTHON_USEDEP}]
	~dev-python/pillow-5.4.1[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.5.1[${PYTHON_USEDEP}]
	>=dev-python/PyChromecast-2.5.2[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.7.3[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.2.6-r1[${PYTHON_USEDEP}]
	>=dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}]
	~dev-python/pysnmp-4.4.8[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.7.5[${PYTHON_USEDEP}]
	>=dev-python/python-jose-cryptodome-1.3.2[${PYTHON_USEDEP}]
	=dev-python/RestrictedPython-4.0_beta8[${PYTHON_USEDEP}]
	~dev-python/setuptools-40.8.0[${PYTHON_USEDEP}]
	~dev-python/sqlalchemy-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/typing-3.6.4-r1[${PYTHON_USEDEP}]
	~dev-python/transitions-0.6.9[${PYTHON_USEDEP}]
	~dev-python/tzlocal-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/ua-parser-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.24.2[${PYTHON_USEDEP}]
	>=dev-python/user-agents-2.0[${PYTHON_USEDEP}]
	>=dev-python/vobject-0.9.6.1[${PYTHON_USEDEP}]
	>=dev-python/wakeonlan-1.1.6[${PYTHON_USEDEP}]
	=dev-python/warrant-0.6.1-r1[${PYTHON_USEDEP}]
	>=dev-python/websockets-7.0[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.54.0[${PYTHON_USEDEP}]
	~dev-python/xmltodict-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.21.3[${PYTHON_USEDEP}]
	>=media-libs/mutagen-1.42.0
	atv? ( >=dev-python/pyatv-0.3.12[${PYTHON_USEDEP}] )
	esphome? ( ~dev-python/aioesphomeapi-1.6.0[${PYTHON_USEDEP}] )
	enigma? ( ~dev-python/openwebifpy-3.1.1[${PYTHON_USEDEP}] )
	androidtv? ( ~dev-python/androidtv-0.0.15[${PYTHON_USEDEP}] )
	hs100? ( >=dev-python/pyHS100-0.3.4[${PYTHON_USEDEP}] )
	maxcube? ( ~dev-python/maxcube-api-0.1.0[${PYTHON_USEDEP}] )
	musiccast? ( >=dev-python/pymusiccast-0.1.6[${PYTHON_USEDEP}] )
	mysql? ( dev-python/mysqlclient[${PYTHON_USEDEP}] )
	mqtt? ( ~dev-python/hbmqtt-0.9.4[${PYTHON_USEDEP}]
			app-misc/mosquitto )
	rxv? ( =dev-python/rxv-0.6.0[${PYTHON_USEDEP}]
			dev-python/defusedxml[${PYTHON_USEDEP}] )
	denonavr? ( ~dev-python/denonavr-0.7.8[${PYTHON_USEDEP}] )
	samsungtv? ( >=dev-python/samsungctl-0.7.1[${PYTHON_USEDEP}] )
	sonos? ( >=dev-python/pysonos-0.0.10[${PYTHON_USEDEP}] )
	ssl? ( 	dev-libs/openssl:0
			app-crypt/certbot
			net-proxy/haproxy )
	tradfri? ( >=dev-python/pytradfri-6.0.1[${PYTHON_USEDEP}]
		 sys-devel/autoconf:2.69 )
	wemo? ( >=dev-python/pywemo-0.4.34[${PYTHON_USEDEP}] )
	frontend? ( =app-misc/home-assistant-frontend-20190424.0 )
	homematic? ( ~dev-python/pyhomematic-0.1.58[${PYTHON_USEDEP}] )
	asuswrt? ( ~dev-python/aioasuswrt-1.1.21[${PYTHON_USEDEP}] )
	qnap? ( ~dev-python/qnapstats-0.3.0[${PYTHON_USEDEP}] )
	speedtest? ( ~net-analyzer/speedtest-cli-2.0.2[${PYTHON_USEDEP}] )
	zoneminder? ( ~dev-python/zm-py-0.3.3[${PYTHON_USEDEP}] )
"

DEPEND="${RDEPEND}
		test? (
				~dev-python/asynctest-0.12.2[${PYTHON_USEDEP}]
				~dev-python/coveralls-1.2.0[${PYTHON_USEDEP}]
				~dev-python/flake8-docstrings-1.3.0[${PYTHON_USEDEP}]
				~dev-python/flake8-3.7.5[${PYTHON_USEDEP}]
				~dev-python/mock-open-1.3.1[${PYTHON_USEDEP}]
				dev-python/mock[${PYTHON_USEDEP}]
				~dev-python/mypy-0.660[${PYTHON_USEDEP}]
				~dev-python/pydocstyle-3.0.0[${PYTHON_USEDEP}]
				~dev-python/pylint-2.2.2[${PYTHON_USEDEP}]
				~dev-python/pytest-aiohttp-0.3.0[${PYTHON_USEDEP}]
				~dev-python/pytest-cov-2.6.1[${PYTHON_USEDEP}]
				~dev-python/pytest-sugar-0.9.2[${PYTHON_USEDEP}]
				~dev-python/pytest-timeout-1.3.3[${PYTHON_USEDEP}]
				~dev-python/pytest-4.2.1[${PYTHON_USEDEP}]
				~dev-python/requests-mock-1.5.2[${PYTHON_USEDEP}]
				dev-python/nose[${PYTHON_USEDEP}]
				dev-python/coverage[${PYTHON_USEDEP}]
			   )"

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

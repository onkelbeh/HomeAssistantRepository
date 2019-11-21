# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

#inherit python-single-r1 user readme.gentoo-r1 eutils # distutils-r1
inherit user readme.gentoo-r1 eutils distutils-r1

MY_P=${P/_beta/b}
MY_PV=${PV/_beta/b}

DESCRIPTION="Open-source home automation platform running on Python on 3.7 (and 3.6 for a short time)"
HOMEPAGE="https://home-assistant.io https://git.edevau.net/onkelbeh/HomeAssistantRepository"
SRC_URI="https://github.com/home-assistant/home-assistant/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="abode ambiclimate androidtv asuswrt atmo atv aurora avea axis bitcoin blockchain buienradar cli ciscomobilityexpress daikin darksky denonavr discogs enigma enocean esphome everlights envoy fronius +frontend gpiozero growl harmony heos here hkavr holidays homekit homematic homematicip hpilo hs100 hue incomfort influxdb maxcube maxcube_hack miio mikrotik mqtt musiccast +mysql openwrt plex qnap roku rxv samsungtv sma socat somfy sonos shodan speedtest ssl test tradfri ubee unify vera wemo wink withings wled wwlln xknx youtube z-wave zigbee zoneminder"

RDEPEND="${PYTHON_DEPS}
	!app-misc/homeassistant-bin
	>=dev-lang/python-3.6.5
	app-admin/logrotate
	dev-db/sqlite
	dev-libs/libfastjson
	>=dev-libs/xerces-c-3.1.4-r1
	~dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}]
	~dev-python/astral-1.10.1[${PYTHON_USEDEP}]
	~dev-python/async_timeout-3.0.1[${PYTHON_USEDEP}]
	~dev-python/attrs-19.3.0[${PYTHON_USEDEP}]
	~dev-python/bcrypt-3.1.7[${PYTHON_USEDEP}]
	>=dev-python/certifi-2019.9.11[${PYTHON_USEDEP}]
	~dev-python/contextvars-2.4[${PYTHON_USEDEP}]
	~dev-python/cryptography-2.8[${PYTHON_USEDEP}]
	>=dev-python/immutables-0.9[${PYTHON_USEDEP}]
	~dev-python/importlib-metadata-0.23[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.10.3[${PYTHON_USEDEP}]
	~dev-python/passlib-1.7.1-r1[${PYTHON_USEDEP}]
	>=dev-python/pip-8.0.3-r1[${PYTHON_USEDEP}]
	~dev-python/pyjwt-1.7.1[${PYTHON_USEDEP}]
	~dev-python/python-slugify-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2019.3[${PYTHON_USEDEP}]
	~dev-python/pyyaml-5.1.2[${PYTHON_USEDEP}]
	=dev-python/requests-2.22.0-r1[${PYTHON_USEDEP}]
	~dev-python/ruamel-yaml-0.15.100[${PYTHON_USEDEP}]
	~dev-python/voluptuous-0.11.7[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.3.0[${PYTHON_USEDEP}]

	>=app-crypt/acme-0.32.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/asn1crypto-0.24.0[${PYTHON_USEDEP}]
	~dev-python/beautifulsoup-4.8.1[${PYTHON_USEDEP}]
	~dev-python/blinkpy-0.14.2[${PYTHON_USEDEP}]
	~dev-python/boto3-1.9.252[${PYTHON_USEDEP}]
	~dev-python/aiobotocore-0.10.4[${PYTHON_USEDEP}]
	~dev-python/caldav-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/cdu-0.1.3[${PYTHON_USEDEP}]
	~dev-python/cffi-1.12.2[${PYTHON_USEDEP}]
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
	~dev-python/hass-nabucasa-0.29[${PYTHON_USEDEP}]
	>=dev-python/idna-2.8[${PYTHON_USEDEP}]
	>=dev-python/idna-ssl-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/ifaddr-0.1.6[${PYTHON_USEDEP}]
	>=dev-python/jmespath-0.9.4[${PYTHON_USEDEP}]
	>=dev-python/jose-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/jsonrpc-async-0.6[${PYTHON_USEDEP}]
	~dev-python/jsonrpc-base-1.0[${PYTHON_USEDEP}]
	~dev-python/jsonrpc-websocket-0.6[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.3.3[${PYTHON_USEDEP}]
	>=dev-python/multidict-4.5.2[${PYTHON_USEDEP}]
	>=dev-python/netdisco-2.6.0[${PYTHON_USEDEP}]
	>=dev-python/nose-1.3.7[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.17.3[${PYTHON_USEDEP}]
	~dev-python/paho-mqtt-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/pbr-5.1.3[${PYTHON_USEDEP}]
	~dev-python/pillow-6.2.1[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.6.5[${PYTHON_USEDEP}]
	>=dev-python/PyChromecast-4.0.1[${PYTHON_USEDEP}]
	>=dev-python/pycparser-2.19[${PYTHON_USEDEP}]
	|| ( >=dev-python/pycryptodome-3.7.3[${PYTHON_USEDEP}] dev-python/pycrypto[${PYTHON_USEDEP}] )
	~dev-python/pyhaversion-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-19.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/PyQRCode-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/pyrfc3339-1.1[${PYTHON_USEDEP}]
	~dev-python/pysnmp-4.4.12[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/python-jose-cryptodome-1.3.2[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.9.1[${PYTHON_USEDEP}]
	=dev-python/RestrictedPython-5.0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-40.8.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.12.0[${PYTHON_USEDEP}]
	~dev-python/sqlalchemy-1.3.10[${PYTHON_USEDEP}]
	~dev-python/transitions-0.6.9[${PYTHON_USEDEP}]
	>=dev-python/typing-3.6.4-r1[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/ua-parser-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.3[${PYTHON_USEDEP}]
	=dev-python/user-agents-2.0-r1[${PYTHON_USEDEP}]
	>=dev-python/vobject-0.9.6.1[${PYTHON_USEDEP}]
	>=dev-python/wakeonlan-1.1.6[${PYTHON_USEDEP}]
	=dev-python/warrant-0.6.1-r1[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.54.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-7.0[${PYTHON_USEDEP}]
	~dev-python/xmltodict-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.23.0[${PYTHON_USEDEP}]
	>=media-libs/mutagen-1.42.0

	abode? ( ~dev-python/abodepy-0.16.7[${PYTHON_USEDEP}] )
	ambiclimate? ( ~dev-python/Ambiclimate-0.2.1[${PYTHON_USEDEP}] )
	androidtv? ( ~dev-python/androidtv-0.0.32[${PYTHON_USEDEP}]
			   ~dev-python/adb-shell-0.0.8[${PYTHON_USEDEP}] )
	asuswrt? ( ~dev-python/aioasuswrt-1.1.22[${PYTHON_USEDEP}] )
	atmo? ( ~dev-python/pyatmo-3.0.1[${PYTHON_USEDEP}] )
	atv? ( >=dev-python/pyatv-0.3.13[${PYTHON_USEDEP}] )
	aurora? ( ~dev-python/aurorapy-0.2.6[${PYTHON_USEDEP}] )
	avea? ( ~dev-python/avea-1.4[${PYTHON_USEDEP}] )
	axis? ( ~dev-python/axis-25[${PYTHON_USEDEP}] )
	bitcoin? ( ~dev-python/blockchain-1.4.4[${PYTHON_USEDEP}] )
	blockchain? ( ~dev-python/python-blockchain-api-0.0.2[${PYTHON_USEDEP}] )
	buienradar? ( ~dev-python/buienradar-1.0.1[${PYTHON_USEDEP}] )
	cli? ( app-misc/home-assistant-cli[${PYTHON_USEDEP}] )
	ciscomobilityexpress? ( ~dev-python/ciscomobilityexpress-0.3.3[${PYTHON_USEDEP}] )
	daikin? ( ~dev-python/pydaikin-1.6.1[${PYTHON_USEDEP}] )
	darksky? ( ~dev-python/python-forecastio-1.4.0[${PYTHON_USEDEP}] )
	denonavr? ( ~dev-python/denonavr-0.7.10[${PYTHON_USEDEP}] )
	discogs? ( ~dev-python/discogs_client-2.2.2[${PYTHON_USEDEP}] )
	enigma? ( ~dev-python/openwebifpy-3.1.1[${PYTHON_USEDEP}] )
	esphome? ( ~dev-python/aioesphomeapi-2.5.0[${PYTHON_USEDEP}] )
	everlights? ( ~dev-python/pyeverlights-0.1.0[${PYTHON_USEDEP}] )
	enocean? ( ~dev-python/enocean-0.50.0[${PYTHON_USEDEP}] )
	envoy? ( ~dev-python/envoy-reader-0.8.6[${PYTHON_USEDEP}] )
	fronius? ( ~dev-python/PyFronius-0.4.6[${PYTHON_USEDEP}] )
	frontend? ( ~app-misc/home-assistant-frontend-20191119.2[${PYTHON_USEDEP}] )
	gpiozero? ( ~dev-python/gpiozero-1.5.1[${PYTHON_USEDEP}] )
	growl? ( ~dev-python/gntp-1.0.3[${PYTHON_USEDEP}] )
	harmony? ( ~dev-python/aioharmony-0.1.13[${PYTHON_USEDEP}] )
	heos? ( ~dev-python/pyheos-0.6.0[${PYTHON_USEDEP}] )
	here? ( ~dev-python/herepy-0.6.3.1[${PYTHON_USEDEP}] )
	hpilo? ( ~dev-python/python-hpilo-4.3[${PYTHON_USEDEP}] )
	hkavr? ( ~dev-python/hkavr-0.0.5[${PYTHON_USEDEP}] )
	holidays? ( ~dev-python/holidays-0.9.11[${PYTHON_USEDEP}] )
	homekit? ( ~dev-python/homekit-python-0.15.0[${PYTHON_USEDEP}] )
	homematic? ( ~dev-python/pyhomematic-0.1.61[${PYTHON_USEDEP}] )
	homematicip? ( ~dev-python/homematicip-0.10.12[${PYTHON_USEDEP}] )
	hs100? ( >=dev-python/pyHS100-0.3.5[${PYTHON_USEDEP}] )
	hue? ( ~dev-python/aiohue-1.9.2[${PYTHON_USEDEP}] )
	incomfort? ( ~dev-python/incomfort-client-0.4.0[${PYTHON_USEDEP}] )
	influxdb? ( dev-db/influxdb
			  ~dev-python/influxdb-5.2.3[${PYTHON_USEDEP}] )
	maxcube? ( ~dev-python/maxcube-api-0.1.0[${PYTHON_USEDEP}] )
	miio? ( ~dev-python/python-miio-0.4.7[${PYTHON_USEDEP}] )
	mikrotik? ( ~dev-python/librouteros-2.3.0[${PYTHON_USEDEP}] )
	mqtt? ( ~dev-python/hbmqtt-0.9.5[${PYTHON_USEDEP}]
			app-misc/mosquitto )
	musiccast? ( >=dev-python/pymusiccast-0.1.6[${PYTHON_USEDEP}] )
	mysql? ( || ( dev-python/mysqlclient[${PYTHON_USEDEP}]
			 dev-python/mysql-python[${PYTHON_USEDEP}] )
			 virtual/mysql )
	openwrt? ( ~dev-python/openwrt-luci-rpc-1.1.2[${PYTHON_USEDEP}] )
	plex? ( ~dev-python/PlexAPI-3.3.0[${PYTHON_USEDEP}] )
	qnap? ( ~dev-python/qnapstats-0.3.0[${PYTHON_USEDEP}] )
	roku? ( ~dev-python/roku-3.1[${PYTHON_USEDEP}] )
	rxv? ( =dev-python/rxv-0.6.0[${PYTHON_USEDEP}]
			~dev-python/defusedxml-0.6.0[${PYTHON_USEDEP}] )
	samsungtv? ( ~dev-python/samsungctl-0.7.1[${PYTHON_USEDEP}] )
	sma? ( ~dev-python/pysma-0.3.4[${PYTHON_USEDEP}] )
	socat? ( net-misc/socat )
	somfy? ( ~dev-python/pymfy-0.6.0[${PYTHON_USEDEP}] )
	sonos? ( >=dev-python/pysonos-0.0.24[${PYTHON_USEDEP}] )
	shodan? ( ~dev-python/shodan-1.19.0[${PYTHON_USEDEP}] )
	speedtest? ( ~net-analyzer/speedtest-cli-2.1.2[${PYTHON_USEDEP}] )
	ssl? ( 	dev-libs/openssl:0
			app-crypt/certbot
			net-proxy/haproxy )
	tradfri? ( >=dev-python/pytradfri-6.4.0[${PYTHON_USEDEP}] )
	ubee? ( ~dev-python/pyubee-0.7[${PYTHON_USEDEP}] )
	unify? ( ~dev-python/aiounify-11[${PYTHON_USEDEP}] )
	vera? ( ~dev-python/pyvera-0.3.6[${PYTHON_USEDEP}] )
	wemo? ( >=dev-python/pywemo-0.4.34[${PYTHON_USEDEP}] )
	wink? ( ~dev-python/pubnubsub-handler-1.0.8[${PYTHON_USEDEP}] )
	withings? ( ~dev-python/withings-api-2.1.3[${PYTHON_USEDEP}] )
	wled? ( ~dev-python/wled-0.1.0[${PYTHON_USEDEP}] )
	wwlln? ( ~dev-python/aiowwlln-2.0.2[${PYTHON_USEDEP}] )
	xknx? ( ~dev-python/xknx-0.11.2[${PYTHON_USEDEP}] )
	youtube? ( ~dev-python/youtube_dl-2019.11.05[${PYTHON_USEDEP}] )
	zigbee? ( ~dev-python/zigpy-deconz-0.7.0[${PYTHON_USEDEP}]
			  ~dev-python/zigpy-homeassistant-0.11.0[${PYTHON_USEDEP}]
			  ~dev-python/zigpy-xbee-homeassistant-0.7.0[${PYTHON_USEDEP}]
			  ~dev-python/bellows-homeassistant-0.11.0[${PYTHON_USEDEP}]
			  ~dev-python/zigpy-zigate-0.5.0[${PYTHON_USEDEP}]
			  ~dev-python/zha-quirks-0.0.28[${PYTHON_USEDEP}] )
	zoneminder? ( ~dev-python/zm-py-0.4.0[${PYTHON_USEDEP}] )
	z-wave? ( ~dev-python/pynacl-1.3.0[${PYTHON_USEDEP}]
			  ~dev-python/homeassistant-pyozw-0.1.4[${PYTHON_USEDEP}]
			  ~dev-python/pydispatcher-2.0.5[${PYTHON_USEDEP}]
			  ~dev-python/cffi-1.12.2[${PYTHON_USEDEP}] )
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

	# https://github.com/home-assistant/home-assistant/issues/28811
	if use maxcube_hack ; then
	   eapply "${FILESDIR}/${PV}-maxcube_TypeError_dirty_hack.patch"
	fi

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

	if use socat ; then
		newinitd "${FILESDIR}/socat-zwave.init.d" "socat-zwave"
		sed -i -e 's/# need socat-zwave/need socat-zwave/g' "${D}/etc/init.d/${PN}" || die
	fi

	if use mqtt ; then
		sed -i -e 's/# need mosquitto/need mosquitto/g' "${D}/etc/init.d/${PN}" || die
	fi

	insinto /etc/logrotate.d
	newins "${FILESDIR}/${PN}.logrotate" "${PN}"

	dobin "${FILESDIR}/hasstest"
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}

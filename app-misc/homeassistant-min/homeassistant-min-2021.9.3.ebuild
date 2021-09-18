# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )
inherit readme.gentoo-r1 eutils distutils-r1 systemd

MY_PN=homeassistant

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/home-assistant/core.git"
	EGIT_BRANCH="dev"
	S="${WORKDIR}/core/"
else
	MY_PV=${PV/_beta/b}
	MY_P=${MY_PN}-${MY_PV}
	SRC_URI="https://github.com/home-assistant/core/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
	S="${WORKDIR}/core-${MY_PV}"
fi

DESCRIPTION="Open-source home automation platform running on Python."
HOMEPAGE="https://home-assistant.io/ https://git.edevau.net/onkelbeh/HomeAssistantRepository/"

LICENSE="Apache-2.0"
SLOT="0"

KEYWORDS="amd64 arm arm64 x86 amd64-linux x86-linux"
IUSE="accuweather airly airvisual alpha_vantage androidtv android_ip_webcam axis bluetooth_le_tracker +caldav cast cli compensation coronavirus darksky +dwd_weather_warnings enigma2 esphome forecast_solar fronius github +homekit homekit_controller http hyperion influxdb knx kodi kraken maxcube mikrotik +mobile_app +mqtt myq mysensors +mysql +notify_events +otp owntracks ozw +ping +plex ps4 +python_script qnap qvr_pro +recorder +rest ring samsungtv +scrape season shelly signal_messenger +snmp socat sonos speedtestdotnet +sql +ssl systemd systemmonitor tasmota test tile tplink tradfri +version +wake_on_lan wemo whois workday yamaha yamaha_musiccast zeroconf zwave +zwave_js"

# external deps
RDEPEND="${PYTHON_DEPS} acct-group/${MY_PN} acct-user/${MY_PN}
	|| ( dev-lang/python:3.8 dev-lang/python:3.9 dev-lang/python:3.10 )
	app-admin/logrotate
	dev-db/sqlite
	dev-libs/libfastjson
	>=dev-libs/xerces-c-3.1.4-r1"

# make sure no conflicting main Ebuild is installed
RDEPEND="${RDEPEND}
	!app-misc/homeassistant
	!app-misc/homeassistant-full"

# Home Assistant Core dependencies
# from package_constraints.txt
RDEPEND="${RDEPEND}
	~dev-python/aiodiscover-1.4.2[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.7.4_p0[${PYTHON_USEDEP}]
	~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	~dev-python/astral-2.2[${PYTHON_USEDEP}]
	~dev-python/async-upnp-client-0.20.0[${PYTHON_USEDEP}]
	~dev-python/async_timeout-3.0.1[${PYTHON_USEDEP}]
	~dev-python/attrs-21.2.0[${PYTHON_USEDEP}]
	~dev-python/awesomeversion-21.4.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/backports-zoneinfo[${PYTHON_USEDEP}]' python3_8)
	~dev-python/bcrypt-3.1.7[${PYTHON_USEDEP}]
	>=dev-python/btlewrap-0.0.10[${PYTHON_USEDEP}]
	>=dev-python/certifi-2020.12.5[${PYTHON_USEDEP}]
	~dev-python/ciso8601-2.1.3[${PYTHON_USEDEP}]
	~dev-python/cryptography-3.3.2[${PYTHON_USEDEP}]
	~dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	~dev-python/emoji-1.2.0[${PYTHON_USEDEP}]
	~dev-python/google-api-core-1.31.2[${PYTHON_USEDEP}]
	~dev-python/google-cloud-pubsub-2.1.0[${PYTHON_USEDEP}]
	~dev-python/grpcio-1.31.0[${PYTHON_USEDEP}]
	>=dev-python/h11-0.12.0[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.46.0[${PYTHON_USEDEP}]
	~dev-python/home-assistant-frontend-20210830.0[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.19.0[${PYTHON_USEDEP}]
	~dev-python/httpx-0.19.0[${PYTHON_USEDEP}]
	~dev-python/ifaddr-0.1.7[${PYTHON_USEDEP}]
	~dev-python/jinja-3.0.1[${PYTHON_USEDEP}]
	~dev-python/paho-mqtt-1.5.1[${PYTHON_USEDEP}]
	~dev-python/pandas-1.3.0[${PYTHON_USEDEP}]
	~dev-python/pillow-8.2.0[${PYTHON_USEDEP}]
	<dev-python/pip-20.3.0
	>=dev-python/pycryptodome-3.6.6[${PYTHON_USEDEP}]
	~dev-python/pyjwt-1.7.1[${PYTHON_USEDEP}]
	~dev-python/pynacl-1.4.0[${PYTHON_USEDEP}]
	~dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	~dev-python/python-slugify-4.0.1[${PYTHON_USEDEP}]
	~dev-python/pyudev-0.22.0[${PYTHON_USEDEP}]
	~dev-python/pyyaml-5.4.1[${PYTHON_USEDEP}]
	~dev-python/regex-2021.8.28[${PYTHON_USEDEP}]
	~dev-python/requests-2.25.1[${PYTHON_USEDEP}]
	~dev-python/ruamel-yaml-0.15.100[${PYTHON_USEDEP}]
	~net-analyzer/scapy-2.4.5
	~dev-python/sqlalchemy-1.4.23[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.24.3[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.4.0[${PYTHON_USEDEP}]
	~dev-python/voluptuous-0.12.1[${PYTHON_USEDEP}]
	~dev-python/yarl-1.6.3[${PYTHON_USEDEP}]
	~dev-python/zeroconf-0.36.2[${PYTHON_USEDEP}]"

# unknown origin, still something to clean up here
# some moved to suggested USE Flags
#
# auth/mfa_modules/totp.py:REQUIREMENTS = ["pyotp==2.3.0", "PyQRCode==1.2.1"]
# scripts/check_config.py:REQUIREMENTS = ("colorlog==5.0.1",)

RDEPEND="${RDEPEND}
	~dev-python/colorlog-5.0.1[${PYTHON_USEDEP}]
	>=dev-python/multidict-4.5.2[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}]
	dev-python/pycparser[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.56.0[${PYTHON_USEDEP}]
	~media-libs/mutagen-1.45.1"

# Module requirements from useflags
RDEPEND="${RDEPEND}
	accuweather? ( ~dev-python/accuweather-0.2.0[${PYTHON_USEDEP}] )
	airly? ( ~dev-python/airly-1.1.0[${PYTHON_USEDEP}] )
	airvisual? ( ~dev-python/pyairvisual-5.0.9[${PYTHON_USEDEP}] )
	alpha_vantage? ( ~dev-python/alpha-vantage-2.3.1[${PYTHON_USEDEP}] )
	androidtv? ( ~dev-python/adb-shell-0.4.0[${PYTHON_USEDEP}] ~dev-python/androidtv-0.0.60[${PYTHON_USEDEP}] ~dev-python/pure-python-adb-0.3.0[${PYTHON_USEDEP}] )
	android_ip_webcam? ( ~dev-python/pydroid-ipcam-0.8[${PYTHON_USEDEP}] )
	axis? ( ~dev-python/axis-44[${PYTHON_USEDEP}] )
	bluetooth_le_tracker? ( ~dev-python/pygatt-4.0.5[${PYTHON_USEDEP}] )
	caldav? ( ~dev-python/caldav-0.7.1[${PYTHON_USEDEP}] )
	cast? ( ~dev-python/pychromecast-9.2.0[${PYTHON_USEDEP}] )
	cli? ( app-misc/home-assistant-cli )
	compensation? ( ~dev-python/numpy-1.21.1[${PYTHON_USEDEP}] )
	coronavirus? ( ~dev-python/coronavirus-1.1.1[${PYTHON_USEDEP}] )
	darksky? ( ~dev-python/python-forecastio-1.4.0[${PYTHON_USEDEP}] )
	dwd_weather_warnings? ( ~dev-python/dwdwfsapi-1.0.4[${PYTHON_USEDEP}] )
	enigma2? ( ~dev-python/openwebifpy-3.2.7[${PYTHON_USEDEP}] )
	esphome? ( ~dev-python/aioesphomeapi-8.0.0[${PYTHON_USEDEP}] )
	forecast_solar? ( ~dev-python/forecast-solar-2.1.0[${PYTHON_USEDEP}] )
	fronius? ( ~dev-python/PyFronius-0.6.0[${PYTHON_USEDEP}] )
	github? ( ~dev-python/aiogithubapi-21.8.0[${PYTHON_USEDEP}] )
	homekit? ( ~dev-python/HAP-python-4.1.0[${PYTHON_USEDEP}] ~dev-python/fnvhash-0.1.0[${PYTHON_USEDEP}] ~dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}] ~dev-python/base36-0.1.1[${PYTHON_USEDEP}] )
	homekit_controller? ( ~dev-python/aiohomekit-0.6.2[${PYTHON_USEDEP}] )
	http? ( ~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}] )
	hyperion? ( ~dev-python/hyperion-py-0.7.4[${PYTHON_USEDEP}] )
	influxdb? ( ~dev-python/influxdb-5.2.3[${PYTHON_USEDEP}] ~dev-python/influxdb-client-1.14.0[${PYTHON_USEDEP}] )
	knx? ( ~dev-python/xknx-0.18.9[${PYTHON_USEDEP}] )
	kodi? ( ~dev-python/pykodi-0.2.5[${PYTHON_USEDEP}] )
	kraken? ( ~dev-python/krakenex-2.1.0[${PYTHON_USEDEP}] ~dev-python/pykrakenapi-0.1.8[${PYTHON_USEDEP}] )
	maxcube? ( ~dev-python/maxcube-api-0.4.3[${PYTHON_USEDEP}] )
	mikrotik? ( ~dev-python/librouteros-3.0.0[${PYTHON_USEDEP}] )
	mobile_app? ( ~dev-python/pynacl-1.4.0[${PYTHON_USEDEP}] ~dev-python/emoji-1.2.0[${PYTHON_USEDEP}] )
	mqtt? ( ~dev-python/paho-mqtt-1.5.1[${PYTHON_USEDEP}] )
	myq? ( ~dev-python/pymyq-3.1.3[${PYTHON_USEDEP}] )
	mysensors? ( ~dev-python/pymysensors-0.21.0[${PYTHON_USEDEP}] )
	mysql? ( dev-python/mysql-connector-python[${PYTHON_USEDEP}] dev-python/mysqlclient[${PYTHON_USEDEP}] )
	notify_events? ( ~dev-python/notify-events-1.0.4[${PYTHON_USEDEP}] )
	otp? ( ~dev-python/pyotp-2.3.0[${PYTHON_USEDEP}] )
	owntracks? ( ~dev-python/pynacl-1.4.0[${PYTHON_USEDEP}] )
	ozw? ( ~dev-python/python-openzwave-mqtt-1.4.0[${PYTHON_USEDEP}] )
	ping? ( ~dev-python/icmplib-3.0[${PYTHON_USEDEP}] )
	plex? ( ~dev-python/PlexAPI-4.7.0[${PYTHON_USEDEP}] ~dev-python/plexauth-0.0.6[${PYTHON_USEDEP}] ~dev-python/plexwebsocket-0.0.13[${PYTHON_USEDEP}] )
	ps4? ( ~dev-python/pyps4-2ndscreen-1.2.0[${PYTHON_USEDEP}] )
	python_script? ( ~dev-python/RestrictedPython-5.1[${PYTHON_USEDEP}] )
	qnap? ( ~dev-python/qnapstats-0.4.0[${PYTHON_USEDEP}] )
	qvr_pro? ( ~dev-python/pyqvrpro-0.52[${PYTHON_USEDEP}] )
	recorder? ( ~dev-python/sqlalchemy-1.4.23[${PYTHON_USEDEP}] )
	rest? ( ~dev-python/jsonpath-0.82[${PYTHON_USEDEP}] ~dev-python/xmltodict-0.12.0[${PYTHON_USEDEP}] )
	ring? ( ~dev-python/ring-doorbell-0.7.1[${PYTHON_USEDEP}] )
	samsungtv? ( ~dev-python/getmac-0.8.2[${PYTHON_USEDEP}] ~dev-python/samsungctl-0.7.1[${PYTHON_USEDEP}] ~dev-python/samsungtvws-1.6.0[${PYTHON_USEDEP}] ~dev-python/wakeonlan-2.0.1[${PYTHON_USEDEP}] )
	scrape? ( ~dev-python/beautifulsoup4-4.9.3[${PYTHON_USEDEP}] )
	season? ( ~dev-python/ephem-3.7.7.0[${PYTHON_USEDEP}] )
	shelly? ( ~dev-python/aioshelly-0.6.4[${PYTHON_USEDEP}] )
	signal_messenger? ( ~dev-python/pysignalclirestapi-0.3.4[${PYTHON_USEDEP}] )
	snmp? ( ~dev-python/pysnmp-4.4.12[${PYTHON_USEDEP}] )
	socat? ( net-misc/socat )
	sonos? ( ~dev-python/soco-0.23.3[${PYTHON_USEDEP}] )
	speedtestdotnet? ( ~net-analyzer/speedtest-cli-2.1.3[${PYTHON_USEDEP}] )
	sql? ( ~dev-python/sqlalchemy-1.4.23[${PYTHON_USEDEP}] )
	ssl? ( dev-libs/openssl app-crypt/certbot net-proxy/haproxy )
	systemmonitor? ( ~dev-python/psutil-5.8.0[${PYTHON_USEDEP}] )
	tasmota? ( ~dev-python/HATasmota-0.2.20[${PYTHON_USEDEP}] )
	tile? ( ~dev-python/pytile-5.2.3[${PYTHON_USEDEP}] )
	tplink? ( ~dev-python/pyHS100-0.3.5.2[${PYTHON_USEDEP}] )
	tradfri? ( ~dev-python/pytradfri-7.0.6[${PYTHON_USEDEP}] )
	version? ( ~dev-python/pyhaversion-21.7.0[${PYTHON_USEDEP}] )
	wake_on_lan? ( ~dev-python/wakeonlan-2.0.1[${PYTHON_USEDEP}] )
	wemo? ( ~dev-python/pywemo-0.6.7[${PYTHON_USEDEP}] )
	whois? ( ~dev-python/python-whois-0.7.3[${PYTHON_USEDEP}] )
	workday? ( ~dev-python/holidays-0.11.2[${PYTHON_USEDEP}] )
	yamaha? ( ~dev-python/rxv-0.6.0[${PYTHON_USEDEP}] )
	yamaha_musiccast? ( ~dev-python/aiomusiccast-0.9.1[${PYTHON_USEDEP}] )
	zeroconf? ( ~dev-python/zeroconf-0.36.2[${PYTHON_USEDEP}] )
	zwave? ( ~dev-python/homeassistant-pyozw-0.1.10[${PYTHON_USEDEP}] ~dev-python/PyDispatcher-2.0.5[${PYTHON_USEDEP}] )
	zwave_js? ( ~dev-python/zwave-js-server-python-0.29.1[${PYTHON_USEDEP}] )"

BDEPEND="${RDEPEND}
	test? (
		~dev-python/codecov-2.1.12[${PYTHON_USEDEP}]
		~dev-python/coverage-5.5[${PYTHON_USEDEP}]
		~dev-python/jsonpickle-1.4.1[${PYTHON_USEDEP}]
		~dev-python/mock-open-1.4.0[${PYTHON_USEDEP}]
		~dev-python/mypy-0.910[${PYTHON_USEDEP}]
		~dev-python/pipdeptree-1.0.0[${PYTHON_USEDEP}]
		~dev-vcs/pre-commit-2.14.0
		~dev-python/pylint-strict-informational-0.1[${PYTHON_USEDEP}]
		~dev-python/pylint-2.10.2[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-2.12.1[${PYTHON_USEDEP}]
		~dev-python/pytest-sugar-0.9.4[${PYTHON_USEDEP}]
		~dev-python/pytest-test-groups-1.0.3[${PYTHON_USEDEP}]
		~dev-python/pytest-timeout-1.4.2[${PYTHON_USEDEP}]
		~dev-python/pytest-xdist-2.2.1[${PYTHON_USEDEP}]
		~dev-python/pytest-6.2.4[${PYTHON_USEDEP}]
		~dev-python/requests-mock-1.9.2[${PYTHON_USEDEP}]
		~dev-python/responses-0.12.0[${PYTHON_USEDEP}]
		~dev-python/respx-0.17.0[${PYTHON_USEDEP}]
		~dev-python/stdlib-list-0.7.0[${PYTHON_USEDEP}]
		~dev-python/tqdm-4.49.0[${PYTHON_USEDEP}]
	)
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]"

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

S="${WORKDIR}/core-${MY_PV}"

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


# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..11} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="homeassistant"
inherit distutils-r1 readme.gentoo-r1 systemd pypi

MY_PN=homeassistant

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/home-assistant/core.git"
	EGIT_BRANCH="dev"
	S="${WORKDIR}/core/"
else
	MY_PV=${PV/_beta/b}
	MY_P=${MY_PN}-${MY_PV}
	SRC_URI="$(pypi_sdist_url)
	https://github.com/home-assistant/core/archive/${MY_PV}.tar.gz -> ${MY_P}.gh.tar.gz"
fi

DESCRIPTION="Open-source home automation platform running on Python."
HOMEPAGE="https://home-assistant.io/ https://git.edevau.net/onkelbeh/HomeAssistantRepository/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="accuweather airly airvisual alpha_vantage androidtv android_ip_webcam axis bluetooth bluetooth_le_tracker +caldav camera cast cli co2signal compensation coronavirus darksky dlna_dmr dlna_dms +dwd_weather_warnings ecowitt enigma2 esphome ffmpeg file forecast_solar fronius github +homekit homekit_controller http hyperion influxdb knx kodi kraken local_calendar +mariadb maxcube mikrotik +mobile_app modbus +mosquitto +mqtt myq mysensors mysql +notify_events octoprint onvif +otp owntracks +ping +plex ps4 +python_script qnap qvr_pro radio_browser +recorder +rest ring samsungtv +scrape season shelly signal_messenger +snmp socat sonos speedtestdotnet +spotify +sql +ssl systemd systemmonitor tankerkoenig tasmota test tile tomorrowio tplink upnp utility_meter +version +wake_on_lan wemo whois workday yamaha yamaha_musiccast zeroconf zha +zwave_js"
RESTRICT="!test? ( test )"

# external deps
RDEPEND="${PYTHON_DEPS} acct-group/${MY_PN} acct-user/${MY_PN}
	|| ( dev-lang/python:3.9 dev-lang/python:3.10 dev-lang/python:3.11 )
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
	~dev-python/aiodiscover-1.4.16[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.8.4[${PYTHON_USEDEP}]
	~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	~dev-python/anyio-3.6.2[${PYTHON_USEDEP}]
	~dev-python/astral-2.2[${PYTHON_USEDEP}]
	~dev-python/async-upnp-client-0.33.1[${PYTHON_USEDEP}]
	~dev-python/async-timeout-4.0.2[${PYTHON_USEDEP}]
	~dev-python/atomicwrites-homeassistant-1.4.1[${PYTHON_USEDEP}]
	~dev-python/attrs-22.2.0[${PYTHON_USEDEP}]
	<dev-python/Authlib-1.0[${PYTHON_USEDEP}]
	~dev-python/awesomeversion-22.9.0[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.0[${PYTHON_USEDEP}]
	~dev-python/bcrypt-4.0.1[${PYTHON_USEDEP}]
	~dev-python/bleak-retry-connector-3.0.2[${PYTHON_USEDEP}]
	~dev-python/bleak-0.20.1[${PYTHON_USEDEP}]
	~dev-python/bluetooth-adapters-0.15.3[${PYTHON_USEDEP}]
	~dev-python/bluetooth-auto-recovery-1.0.3[${PYTHON_USEDEP}]
	~dev-python/bluetooth-data-tools-0.3.1[${PYTHON_USEDEP}]
	>=dev-python/btlewrap-0.0.10[${PYTHON_USEDEP}]
	>=dev-python/certifi-2021.5.30[${PYTHON_USEDEP}]
	~dev-python/ciso8601-2.3.0[${PYTHON_USEDEP}]
	~dev-python/cryptography-40.0.1[${PYTHON_USEDEP}]
	~dev-python/dbus-fast-1.84.2[${PYTHON_USEDEP}]
	>=dev-python/faust-cchardet-2.1.18[${PYTHON_USEDEP}]
	~dev-python/fnvhash-0.1.0[${PYTHON_USEDEP}]
	~dev-python/grpcio-reflection-1.51.1[${PYTHON_USEDEP}]
	~dev-python/grpcio-status-1.51.1[${PYTHON_USEDEP}]
	~dev-python/grpcio-1.51.1[${PYTHON_USEDEP}]
	~dev-python/h11-0.14.0[${PYTHON_USEDEP}]
	~dev-python/ha-av-10.0.0_beta5[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.63.1[${PYTHON_USEDEP}]
	~dev-python/hassil-1.0.6[${PYTHON_USEDEP}]
	~dev-python/home-assistant-bluetooth-1.9.3[${PYTHON_USEDEP}]
	~dev-python/home-assistant-frontend-20230411.1[${PYTHON_USEDEP}]
	~dev-python/home-assistant-intents-2023.3.29[${PYTHON_USEDEP}]
	~dev-python/httpcore-0.16.3[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.19.0[${PYTHON_USEDEP}]
	~dev-python/httpx-0.23.3[${PYTHON_USEDEP}]
	>=dev-python/hyperframe-5.2.0[${PYTHON_USEDEP}]
	~dev-python/ifaddr-0.1.7[${PYTHON_USEDEP}]
	~dev-python/janus-1.0.0[${PYTHON_USEDEP}]
	~dev-python/jinja-3.1.2[${PYTHON_USEDEP}]
	~dev-python/libcst-0.3.23[${PYTHON_USEDEP}]
	~dev-python/lru-dict-1.1.8[${PYTHON_USEDEP}]
	~dev-python/matplotlib-3.6.1[${PYTHON_USEDEP}]
	>=dev-python/multidict-6.0.2[${PYTHON_USEDEP}]
	~dev-python/numpy-1.23.2[${PYTHON_USEDEP}]
	~dev-python/orjson-3.8.7[${PYTHON_USEDEP}]
	~dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '~dev-python/pandas-1.4.3[${PYTHON_USEDEP}]' python3_{9..10})
	~dev-python/pillow-9.4.0[${PYTHON_USEDEP}]
	<dev-python/pip-23.1
	~dev-python/psutil-home-assistant-0.0.1[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.6.6[${PYTHON_USEDEP}]
	~dev-python/pyjwt-2.6.0[${PYTHON_USEDEP}]
	~dev-python/pynacl-1.5.0[${PYTHON_USEDEP}]
	~dev-python/pyopenssl-23.1.0[${PYTHON_USEDEP}]
	~dev-python/pyopenssl-23.1.0[${PYTHON_USEDEP}]
	~dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-3.13.1[${PYTHON_USEDEP}]
	<dev-python/python-engineio-4[${PYTHON_USEDEP}]
	~dev-python/python-slugify-4.0.1[${PYTHON_USEDEP}]
	>=dev-python/python-socketio-4.6.0[${PYTHON_USEDEP}]
	<dev-python/python-socketio-5.0[${PYTHON_USEDEP}]
	~dev-python/PyTurboJPEG-1.6.7[${PYTHON_USEDEP}]
	~dev-python/pyudev-0.23.2[${PYTHON_USEDEP}]
	~dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	~dev-python/regex-2021.8.28[${PYTHON_USEDEP}]
	~dev-python/requests-2.28.2[${PYTHON_USEDEP}]
	~net-analyzer/scapy-2.5.0
	~dev-python/sqlalchemy-2.0.7[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.5.0[${PYTHON_USEDEP}]
	<dev-python/typing-extensions-5.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '~dev-python/uamqp-1.6.0[${PYTHON_USEDEP}]' python3_{9..10})
	~dev-python/ulid-transform-0.6.3[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.5[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.6.0[${PYTHON_USEDEP}]
	~dev-python/voluptuous-0.13.1[${PYTHON_USEDEP}]
	>=dev-python/websockets-11.0.1[${PYTHON_USEDEP}]
	~dev-python/yarl-1.8.1[${PYTHON_USEDEP}]
	~dev-python/zeroconf-0.56.0[${PYTHON_USEDEP}]"

# unknown origin, still something to clean up here
# some moved to suggested USE Flags
#

RDEPEND="${RDEPEND}
	~dev-python/colorlog-6.6.0[${PYTHON_USEDEP}]
	~dev-python/pyotp-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}]
	dev-python/pycparser[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.57.0[${PYTHON_USEDEP}]"
# Module requirements from useflags
RDEPEND="${RDEPEND}
	accuweather? ( ~dev-python/accuweather-0.5.0[${PYTHON_USEDEP}] )
	airly? ( ~dev-python/airly-1.1.0[${PYTHON_USEDEP}] )
	airvisual? ( ~dev-python/pyairvisual-2022.12.1[${PYTHON_USEDEP}] )
	alpha_vantage? ( ~dev-python/alpha-vantage-2.3.1[${PYTHON_USEDEP}] )
	androidtv? ( ~dev-python/adb-shell-0.4.3[${PYTHON_USEDEP}] ~dev-python/androidtv-0.0.70[${PYTHON_USEDEP}] ~dev-python/pure-python-adb-0.3.0[${PYTHON_USEDEP}] )
	android_ip_webcam? ( ~dev-python/pydroid-ipcam-2.0.0[${PYTHON_USEDEP}] )
	axis? ( ~dev-python/axis-47[${PYTHON_USEDEP}] )
	bluetooth? ( ~dev-python/bleak-0.20.1[${PYTHON_USEDEP}] ~dev-python/bleak-retry-connector-3.0.2[${PYTHON_USEDEP}] ~dev-python/bluetooth-adapters-0.15.3[${PYTHON_USEDEP}] ~dev-python/bluetooth-auto-recovery-1.0.3[${PYTHON_USEDEP}] ~dev-python/bluetooth-data-tools-0.3.1[${PYTHON_USEDEP}] ~dev-python/dbus-fast-1.84.2[${PYTHON_USEDEP}] )
	bluetooth_le_tracker? ( ~dev-python/pygatt-4.0.5[${PYTHON_USEDEP}] )
	caldav? ( ~dev-python/caldav-1.2.0[${PYTHON_USEDEP}] )
	camera? ( ~dev-python/PyTurboJPEG-1.6.7[${PYTHON_USEDEP}] )
	cast? ( ~dev-python/pychromecast-13.0.7[${PYTHON_USEDEP}] )
	cli? ( app-misc/home-assistant-cli )
	co2signal? ( ~dev-python/CO2Signal-0.4.2[${PYTHON_USEDEP}] )
	compensation? ( ~dev-python/numpy-1.23.2[${PYTHON_USEDEP}] )
	coronavirus? ( ~dev-python/coronavirus-1.1.1[${PYTHON_USEDEP}] )
	darksky? ( ~dev-python/python-forecastio-1.4.0[${PYTHON_USEDEP}] )
	dlna_dmr? ( ~dev-python/async-upnp-client-0.33.1[${PYTHON_USEDEP}] ~dev-python/getmac-0.8.2[${PYTHON_USEDEP}] )
	dlna_dms? ( ~dev-python/async-upnp-client-0.33.1[${PYTHON_USEDEP}] )
	dwd_weather_warnings? ( ~dev-python/dwdwfsapi-1.0.5[${PYTHON_USEDEP}] )
	ecowitt? ( ~dev-python/aioecowitt-2023.1.0[${PYTHON_USEDEP}] )
	enigma2? ( ~dev-python/openwebifpy-3.2.7[${PYTHON_USEDEP}] )
	esphome? ( ~dev-python/aioesphomeapi-13.6.1[${PYTHON_USEDEP}] ~dev-python/esphome-dashboard-api-1.2.3[${PYTHON_USEDEP}] )
	ffmpeg? ( ~dev-python/ha-ffmpeg-3.1.0[${PYTHON_USEDEP}] )
	file? ( ~dev-python/file-read-backwards-2.0.0[${PYTHON_USEDEP}] )
	forecast_solar? ( ~dev-python/forecast-solar-2.2.0[${PYTHON_USEDEP}] )
	fronius? ( ~dev-python/PyFronius-0.7.1[${PYTHON_USEDEP}] )
	github? ( ~dev-python/aiogithubapi-22.10.1[${PYTHON_USEDEP}] )
	homekit? ( ~dev-python/HAP-python-4.6.0[${PYTHON_USEDEP}] ~dev-python/fnvhash-0.1.0[${PYTHON_USEDEP}] ~dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}] ~dev-python/base36-0.1.1[${PYTHON_USEDEP}] )
	homekit_controller? ( ~dev-python/aiohomekit-2.6.3[${PYTHON_USEDEP}] )
	http? ( ~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}] )
	hyperion? ( ~dev-python/hyperion-py-0.7.5[${PYTHON_USEDEP}] )
	influxdb? ( ~dev-python/influxdb-5.3.1[${PYTHON_USEDEP}] ~dev-python/influxdb-client-1.24.0[${PYTHON_USEDEP}] )
	knx? ( ~dev-python/xknx-2.7.0[${PYTHON_USEDEP}] )
	kodi? ( ~dev-python/pykodi-0.2.7[${PYTHON_USEDEP}] )
	kraken? ( ~dev-python/krakenex-2.1.0[${PYTHON_USEDEP}] ~dev-python/pykrakenapi-0.1.8[${PYTHON_USEDEP}] )
	local_calendar? ( ~dev-python/ical-4.5.1[${PYTHON_USEDEP}] )
	mariadb? ( dev-python/mysqlclient[${PYTHON_USEDEP}] )
	maxcube? ( ~dev-python/maxcube-api-0.4.3[${PYTHON_USEDEP}] )
	mikrotik? ( ~dev-python/librouteros-3.2.0[${PYTHON_USEDEP}] )
	mobile_app? ( ~dev-python/pynacl-1.5.0[${PYTHON_USEDEP}] )
	modbus? ( ~dev-python/pymodbus-3.1.3[${PYTHON_USEDEP}] )
	mosquitto? ( app-misc/mosquitto )
	mqtt? ( ~dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}] )
	myq? ( ~dev-python/pymyq-3.1.4[${PYTHON_USEDEP}] )
	mysensors? ( ~dev-python/pymysensors-0.24.0[${PYTHON_USEDEP}] )
	mysql? ( dev-python/mysqlclient[${PYTHON_USEDEP}] )
	notify_events? ( ~dev-python/notify-events-1.0.4[${PYTHON_USEDEP}] )
	octoprint? ( ~dev-python/pyoctoprintapi-0.1.11[${PYTHON_USEDEP}] )
	onvif? ( ~dev-python/onvif-zeep-async-1.2.3[${PYTHON_USEDEP}] ~dev-python/WSDiscovery-2.0.0[${PYTHON_USEDEP}] )
	otp? ( ~dev-python/pyotp-2.8.0[${PYTHON_USEDEP}] )
	owntracks? ( ~dev-python/pynacl-1.5.0[${PYTHON_USEDEP}] )
	ping? ( ~dev-python/icmplib-3.0[${PYTHON_USEDEP}] )
	plex? ( ~dev-python/PlexAPI-4.13.2[${PYTHON_USEDEP}] ~dev-python/plexauth-0.0.6[${PYTHON_USEDEP}] ~dev-python/plexwebsocket-0.0.13[${PYTHON_USEDEP}] )
	ps4? ( ~dev-python/pyps4-2ndscreen-1.3.1[${PYTHON_USEDEP}] )
	python_script? ( ~dev-python/RestrictedPython-6.0[${PYTHON_USEDEP}] )
	qnap? ( ~dev-python/qnapstats-0.4.0[${PYTHON_USEDEP}] )
	qvr_pro? ( ~dev-python/pyqvrpro-0.52[${PYTHON_USEDEP}] )
	radio_browser? ( ~dev-python/radios-0.1.1[${PYTHON_USEDEP}] )
	recorder? ( ~dev-python/sqlalchemy-2.0.7[${PYTHON_USEDEP}] ~dev-python/fnvhash-0.1.0[${PYTHON_USEDEP}] )
	rest? ( ~dev-python/jsonpath-0.82[${PYTHON_USEDEP}] ~dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}] )
	ring? ( ~dev-python/ring-doorbell-0.7.2[${PYTHON_USEDEP}] )
	samsungtv? ( ~dev-python/getmac-0.8.2[${PYTHON_USEDEP}] ~dev-python/samsungctl-0.7.1[${PYTHON_USEDEP}] ~dev-python/samsungtvws-2.5.0[${PYTHON_USEDEP}] ~dev-python/wakeonlan-2.1.0[${PYTHON_USEDEP}] ~dev-python/async-upnp-client-0.33.1[${PYTHON_USEDEP}] )
	scrape? ( ~dev-python/beautifulsoup4-4.11.1[${PYTHON_USEDEP}] ~dev-python/lxml-4.9.1[${PYTHON_USEDEP}] )
	season? ( ~dev-python/ephem-4.1.2[${PYTHON_USEDEP}] )
	shelly? ( ~dev-python/aioshelly-5.3.1[${PYTHON_USEDEP}] )
	signal_messenger? ( ~dev-python/pysignalclirestapi-0.3.18[${PYTHON_USEDEP}] )
	snmp? ( ~dev-python/pysnmplib-5.0.21[${PYTHON_USEDEP}] )
	socat? ( net-misc/socat )
	sonos? ( ~dev-python/soco-0.29.1[${PYTHON_USEDEP}] )
	speedtestdotnet? ( ~net-analyzer/speedtest-cli-2.1.3[${PYTHON_USEDEP}] )
	spotify? ( ~dev-python/spotipy-2.22.1[${PYTHON_USEDEP}] )
	sql? ( ~dev-python/sqlalchemy-2.0.7[${PYTHON_USEDEP}] )
	ssl? ( dev-libs/openssl app-crypt/certbot net-proxy/haproxy )
	systemmonitor? ( ~dev-python/psutil-5.9.4[${PYTHON_USEDEP}] )
	tankerkoenig? ( ~dev-python/pytankerkoenig-0.0.6[${PYTHON_USEDEP}] )
	tasmota? ( ~dev-python/HATasmota-0.6.4[${PYTHON_USEDEP}] )
	tile? ( ~dev-python/pytile-2023.4.0[${PYTHON_USEDEP}] )
	tomorrowio? ( ~dev-python/pytomorrowio-0.3.5[${PYTHON_USEDEP}] )
	tplink? ( ~dev-python/python-kasa-0.5.1[${PYTHON_USEDEP}] )
	upnp? ( ~dev-python/async-upnp-client-0.33.1[${PYTHON_USEDEP}] ~dev-python/getmac-0.8.2[${PYTHON_USEDEP}] )
	utility_meter? ( ~dev-python/croniter-1.0.6[${PYTHON_USEDEP}] )
	version? ( ~dev-python/pyhaversion-22.8.0[${PYTHON_USEDEP}] )
	wake_on_lan? ( ~dev-python/wakeonlan-2.1.0[${PYTHON_USEDEP}] )
	wemo? ( ~dev-python/pywemo-0.9.1[${PYTHON_USEDEP}] )
	whois? ( ~dev-python/whois-0.9.27[${PYTHON_USEDEP}] )
	workday? ( ~dev-python/holidays-0.21.13[${PYTHON_USEDEP}] )
	yamaha? ( ~dev-python/rxv-0.7.0[${PYTHON_USEDEP}] )
	yamaha_musiccast? ( ~dev-python/aiomusiccast-0.14.8[${PYTHON_USEDEP}] )
	zeroconf? ( ~dev-python/zeroconf-0.56.0[${PYTHON_USEDEP}] )
	zha? ( ~dev-python/bellows-0.35.1[${PYTHON_USEDEP}] ~dev-python/pyserial-3.5[${PYTHON_USEDEP}] ~dev-python/pyserial-asyncio-0.6[${PYTHON_USEDEP}] ~dev-python/zha-quirks-0.0.97[${PYTHON_USEDEP}] ~dev-python/zigpy-deconz-0.20.0[${PYTHON_USEDEP}] ~dev-python/zigpy-0.54.1[${PYTHON_USEDEP}] ~dev-python/zigpy-xbee-0.17.0[${PYTHON_USEDEP}] ~dev-python/zigpy-zigate-0.10.3[${PYTHON_USEDEP}] ~dev-python/zigpy-znp-0.10.0[${PYTHON_USEDEP}] )
	zwave_js? ( ~dev-python/pyserial-3.5[${PYTHON_USEDEP}] ~dev-python/zwave-js-server-python-0.47.3[${PYTHON_USEDEP}] )"

BDEPEND="${RDEPEND}
	test? (
		~dev-python/astroid-2.15.0[${PYTHON_USEDEP}]
		~dev-python/coverage-7.2.1[${PYTHON_USEDEP}]
		~dev-python/freezegun-1.2.2[${PYTHON_USEDEP}]
		~dev-python/mock-open-1.4.0[${PYTHON_USEDEP}]
		~dev-python/mypy-1.1.1[${PYTHON_USEDEP}]
		~dev-python/pipdeptree-2.7.0[${PYTHON_USEDEP}]
		~dev-vcs/pre-commit-3.1.0
		~dev-python/pydantic-1.10.7[${PYTHON_USEDEP}]
		~dev-python/pylint-per-file-ignores-1.1.0[${PYTHON_USEDEP}]
		~dev-python/pylint-2.17.0[${PYTHON_USEDEP}]
		~dev-python/pytest-asyncio-0.20.3[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
		~dev-python/pytest-freezer-0.4.6[${PYTHON_USEDEP}]
		~dev-python/pytest-picked-0.4.6[${PYTHON_USEDEP}]
		~dev-python/pytest-socket-0.5.1[${PYTHON_USEDEP}]
		~dev-python/pytest-sugar-0.9.6[${PYTHON_USEDEP}]
		~dev-python/pytest-test-groups-1.0.3[${PYTHON_USEDEP}]
		~dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}]
		~dev-python/pytest-unordered-0.5.2[${PYTHON_USEDEP}]
		~dev-python/pytest-xdist-3.2.1[${PYTHON_USEDEP}]
		~dev-python/pytest-7.2.2[${PYTHON_USEDEP}]
		~dev-python/requests-mock-1.10.0[${PYTHON_USEDEP}]
		~dev-python/respx-0.20.1[${PYTHON_USEDEP}]
		~dev-python/syrupy-4.0.0[${PYTHON_USEDEP}]
		~dev-python/tomli-2.0.1[${PYTHON_USEDEP}]
		~dev-python/tqdm-4.64.0[${PYTHON_USEDEP}]
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

DOCS="README.rst"

# ${WORKDIR}/core-${MY_PV}
src_prepare() {
	if use test ; then
		cp -r ${WORKDIR}/core-${MY_PV}/tests ${S}
	fi
	distutils-r1_src_prepare
}

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

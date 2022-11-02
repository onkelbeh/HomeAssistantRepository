# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..10} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 readme.gentoo-r1 systemd

MY_PN=homeassistant

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/home-assistant/core.git"
	EGIT_BRANCH="dev"
	S="${WORKDIR}/core/"
else
	MY_PV=${PV/_beta/b}
	MY_P=${MY_PN}-${MY_PV}
	SRC_URI="https://github.com/home-assistant/core/archive/${MY_PV}.tar.gz -> ${MY_P}.gh.tar.gz"
	S="${WORKDIR}/core-${MY_PV}"
fi

DESCRIPTION="Open-source home automation platform running on Python."
HOMEPAGE="https://home-assistant.io/ https://git.edevau.net/onkelbeh/HomeAssistantRepository/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="abode accuweather acer_projector acmeda adguard ads aftership agent_dvr airly airvisual aladdin_connect alarmdecoder almond alpha_vantage ambiclimate ambient_station amcrest ampio androidtv android_ip_webcam anel_pwrctrl anthemav apache_kafka apcupsd apple_tv apprise aquostv arcam_fmj aruba asuswrt aten_pe atome august aurora_abb_powerone avea avion awair axis backup baidu beewi_smartclim bh1750 bitcoin bizkaibus blackbird blebox blink blinksticklight blinkt blockchain bluetooth bluetooth_le_tracker bluetooth_tracker bme280 bme680 bmw_connected_drive bond braviatv broadlink brother brottsplatskartan brunt bsblan bt_home_hub_5 bt_smarthub buienradar +caldav camera canary cast cisco_mobility_express cli co2signal compensation coronavirus daikin darksky deconz delijn denonavr deutsche_bahn devolo_home_control dexcom dhcp dht discogs discord discovery dlna_dmr dlna_dms doorbird dunehd +dwd_weather_warnings dynalite dyson ecobee emulated_roku enigma2 enocean enphase_envoy environment_canada esphome everlights evohome ffmpeg fibaro file flume flunearyou flux_led foobot forecast_solar fortios freebox fritz fritzbox fritzbox_callmonitor fritzbox_netmonitor fronius garmin_connect gios github gogogate2 greeneye_monitor growatt_server guardian harman_kardon_avr harmony heos here_travel_time +homekit homekit_controller homematic homematicip_cloud hp_ilo http hue hydrawise iaqualink ihc imap incomfort influxdb insteon intesishome ipma ipp islamic_prayer_times jewish_calendar joaoapps_join kef knx kodi kraken lifx linode litterrobot loopenergy luci luftdaten +mariadb maxcube media_extractor meteo_france mfi miflora mikrotik mitemp_bt +mobile_app modbus +mosquitto +mqtt myq mysql nad nederlandse_spoorwegen netatmo netdata +notify_events nuki nws nx584 octoprint onkyo onvif opengarage opensensemap openweathermap opnsense +otp owntracks panasonic_viera philips_js pilight +ping pi_hole +plex plugwise poolsense powerwall ps4 +python_script qnap qvr_pro rachio radio_browser rainbird rainmachine +recorder rejseplanen +rest ring roku roomba roon samsungtv +scrape season shelly shodan signal_messenger simplisafe skybell sma smappee smarthab smartthings +snmp socat solax somfy sonos speedtestdotnet +spotify +sql squeezebox +ssl statsd synology_dsm systemd systemmonitor tankerkoenig tasmota tellduslive tesla test tile tomorrowio toon totalconnect tplink tuya unifi unifi_direct upnp utility_meter vallox velbus velux vera +version vicare vizio +wake_on_lan waqi waze_travel_time webostv wemo whois wink withings wled workday xbox_live xiaomi_aqara xiaomi_miio xiaomi_tv xs1 yamaha yamaha_musiccast yeelight yi zeroconf zerproc zha zhong_hong zoneminder +zwave_js"
RESTRICT="!test? ( test )"

# external deps
RDEPEND="${PYTHON_DEPS} acct-group/${MY_PN} acct-user/${MY_PN}
	|| ( dev-lang/python:3.8 dev-lang/python:3.9 dev-lang/python:3.10 )
	app-admin/logrotate
	dev-db/sqlite
	dev-libs/libfastjson
	>=dev-libs/xerces-c-3.1.4-r1"
# make sure no conflicting main Ebuild is installed
RDEPEND="${RDEPEND}
	!app-misc/homeassistant-min
	!app-misc/homeassistant-full"

# Home Assistant Core dependencies
# from package_constraints.txt
RDEPEND="${RDEPEND}
	~dev-python/aiodiscover-1.4.13[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
	~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	~dev-python/anyio-3.6.1[${PYTHON_USEDEP}]
	~dev-python/astral-2.2[${PYTHON_USEDEP}]
	~dev-python/async-upnp-client-0.31.2[${PYTHON_USEDEP}]
	~dev-python/async-timeout-4.0.2[${PYTHON_USEDEP}]
	~dev-python/atomicwrites-homeassistant-1.4.1[${PYTHON_USEDEP}]
	~dev-python/attrs-21.2.0[${PYTHON_USEDEP}]
	<dev-python/Authlib-1.0[${PYTHON_USEDEP}]
	~dev-python/awesomeversion-22.9.0[${PYTHON_USEDEP}]
	<dev-python/backoff-2.0[${PYTHON_USEDEP}]
	~dev-python/bcrypt-3.1.7[${PYTHON_USEDEP}]
	~dev-python/bleak-retry-connector-2.1.3[${PYTHON_USEDEP}]
	~dev-python/bleak-0.18.1[${PYTHON_USEDEP}]
	~dev-python/bluetooth-adapters-0.6.0[${PYTHON_USEDEP}]
	~dev-python/bluetooth-auto-recovery-0.3.4[${PYTHON_USEDEP}]
	>=dev-python/btlewrap-0.0.10[${PYTHON_USEDEP}]
	>=dev-python/certifi-2021.5.30[${PYTHON_USEDEP}]
	~dev-python/ciso8601-2.2.0[${PYTHON_USEDEP}]
	~dev-python/cryptography-38.0.1[${PYTHON_USEDEP}]
	~dev-python/dbus-fast-1.24.0[${PYTHON_USEDEP}]
	~dev-python/fnvhash-0.1.0[${PYTHON_USEDEP}]
	~dev-python/grpcio-status-1.48.0[${PYTHON_USEDEP}]
	~dev-python/grpcio-1.48.0[${PYTHON_USEDEP}]
	~dev-python/h11-0.12.0[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.56.0[${PYTHON_USEDEP}]
	~dev-python/home-assistant-bluetooth-1.3.0[${PYTHON_USEDEP}]
	~dev-python/home-assistant-frontend-20221010.0[${PYTHON_USEDEP}]
	~dev-python/httpcore-0.15.0[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.19.0[${PYTHON_USEDEP}]
	~dev-python/httpx-0.23.0[${PYTHON_USEDEP}]
	>=dev-python/hyperframe-5.2.0[${PYTHON_USEDEP}]
	~dev-python/ifaddr-0.1.7[${PYTHON_USEDEP}]
	~dev-python/jinja-3.1.2[${PYTHON_USEDEP}]
	~dev-python/libcst-0.3.23[${PYTHON_USEDEP}]
	~dev-python/lru-dict-1.1.8[${PYTHON_USEDEP}]
	>=dev-python/multidict-6.0.2[${PYTHON_USEDEP}]
	~dev-python/numpy-1.23.2[${PYTHON_USEDEP}]
	~dev-python/orjson-3.7.11[${PYTHON_USEDEP}]
	~dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}]
	~dev-python/pandas-1.4.3[${PYTHON_USEDEP}]
	~dev-python/pillow-9.2.0[${PYTHON_USEDEP}]
	<dev-python/pip-22.1.0
	~dev-python/psutil-home-assistant-0.0.1[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.6.6[${PYTHON_USEDEP}]
	~dev-python/pyjwt-2.5.0[${PYTHON_USEDEP}]
	~dev-python/pynacl-1.5.0[${PYTHON_USEDEP}]
	~dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-3.13.1[${PYTHON_USEDEP}]
	<dev-python/python-engineio-4[${PYTHON_USEDEP}]
	~dev-python/python-slugify-4.0.1[${PYTHON_USEDEP}]
	>=dev-python/python-socketio-4.6.0[${PYTHON_USEDEP}]
	<dev-python/python-socketio-5.0[${PYTHON_USEDEP}]
	~dev-python/pyudev-0.23.2[${PYTHON_USEDEP}]
	~dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	~dev-python/regex-2021.8.28[${PYTHON_USEDEP}]
	~dev-python/requests-2.28.1[${PYTHON_USEDEP}]
	~net-analyzer/scapy-2.4.5
	~dev-python/sqlalchemy-1.4.41[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.4.0[${PYTHON_USEDEP}]
	<dev-python/typing-extensions-5.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.5[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.5.0[${PYTHON_USEDEP}]
	~dev-python/voluptuous-0.13.1[${PYTHON_USEDEP}]
	~dev-python/yarl-1.8.1[${PYTHON_USEDEP}]
	~dev-python/python-zeroconf-0.39.1[${PYTHON_USEDEP}]"

# unknown origin, still something to clean up here
# some moved to suggested USE Flags
#
# auth/mfa_modules/totp.py:REQUIREMENTS = ["pyotp==2.7.0", "PyQRCode==1.2.1"]
# scripts/check_config.py:REQUIREMENTS = ("colorlog==6.6.0",)

RDEPEND="${RDEPEND}
	~dev-python/colorlog-6.6.0[${PYTHON_USEDEP}]
	>=dev-python/multidict-5.2.0[${PYTHON_USEDEP}]
	~dev-python/pyotp-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}]
	dev-python/pycparser[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.57.0[${PYTHON_USEDEP}]
	~media-libs/mutagen-1.45.1"
# Module requirements from useflags
RDEPEND="${RDEPEND}
	abode? ( ~dev-python/abodepy-1.2.0[${PYTHON_USEDEP}] )
	accuweather? ( ~dev-python/accuweather-0.4.0[${PYTHON_USEDEP}] )
	acer_projector? ( ~dev-python/pyserial-3.5[${PYTHON_USEDEP}] )
	acmeda? ( ~dev-python/aiopulse-0.4.3[${PYTHON_USEDEP}] )
	adguard? ( ~dev-python/adguardhome-0.5.1[${PYTHON_USEDEP}] )
	ads? ( ~dev-python/pyads-3.2.2[${PYTHON_USEDEP}] )
	aftership? ( ~dev-python/pyaftership-21.11.0[${PYTHON_USEDEP}] )
	agent_dvr? ( ~dev-python/agent-py-0.0.23[${PYTHON_USEDEP}] )
	airly? ( ~dev-python/airly-1.1.0[${PYTHON_USEDEP}] )
	airvisual? ( ~dev-python/pyairvisual-2022.7.0[${PYTHON_USEDEP}] )
	aladdin_connect? ( ~dev-python/AIOAladdinConnect-0.1.46[${PYTHON_USEDEP}] )
	alarmdecoder? ( ~dev-python/adext-0.4.2[${PYTHON_USEDEP}] )
	almond? ( ~dev-python/pyalmond-0.0.2[${PYTHON_USEDEP}] )
	alpha_vantage? ( ~dev-python/alpha-vantage-2.3.1[${PYTHON_USEDEP}] )
	ambiclimate? ( ~dev-python/Ambiclimate-0.2.1[${PYTHON_USEDEP}] )
	ambient_station? ( ~dev-python/aioambient-2021.11.0[${PYTHON_USEDEP}] )
	amcrest? ( ~dev-python/amcrest-1.9.7[${PYTHON_USEDEP}] )
	ampio? ( ~dev-python/asmog-0.0.6[${PYTHON_USEDEP}] )
	androidtv? ( ~dev-python/adb-shell-0.4.3[${PYTHON_USEDEP}] ~dev-python/androidtv-0.0.67[${PYTHON_USEDEP}] ~dev-python/pure-python-adb-0.3.0[${PYTHON_USEDEP}] )
	android_ip_webcam? ( ~dev-python/pydroid-ipcam-2.0.0[${PYTHON_USEDEP}] )
	anel_pwrctrl? ( ~dev-python/anel-pwrctrl-homeassistant-0.0.1[${PYTHON_USEDEP}] )
	anthemav? ( ~dev-python/anthemav-1.4.1[${PYTHON_USEDEP}] )
	apache_kafka? ( ~dev-python/aiokafka-0.7.2[${PYTHON_USEDEP}] )
	apcupsd? ( ~dev-python/apcaccess-0.0.13[${PYTHON_USEDEP}] )
	apple_tv? ( ~dev-python/pyatv-0.10.3[${PYTHON_USEDEP}] )
	apprise? ( ~dev-python/apprise-1.0.0[${PYTHON_USEDEP}] )
	aquostv? ( ~dev-python/sharp_aquos_rc-0.3.2[${PYTHON_USEDEP}] )
	arcam_fmj? ( ~dev-python/arcam-fmj-0.12.0[${PYTHON_USEDEP}] )
	aruba? ( ~dev-python/pexpect-4.6.0[${PYTHON_USEDEP}] )
	asuswrt? ( ~dev-python/aioasuswrt-1.4.0[${PYTHON_USEDEP}] )
	aten_pe? ( ~dev-python/atenpdu-0.3.2[${PYTHON_USEDEP}] )
	atome? ( ~dev-python/pyAtome-0.1.1[${PYTHON_USEDEP}] )
	august? ( ~dev-python/yalexs-1.2.6[${PYTHON_USEDEP}] )
	aurora_abb_powerone? ( ~dev-python/aurorapy-0.2.7[${PYTHON_USEDEP}] )
	avea? ( ~dev-python/avea-1.5.1[${PYTHON_USEDEP}] )
	avion? ( ~dev-python/avion-0.10[${PYTHON_USEDEP}] )
	awair? ( ~dev-python/python-awair-0.2.4[${PYTHON_USEDEP}] )
	axis? ( ~dev-python/axis-44[${PYTHON_USEDEP}] )
	backup? ( ~dev-python/securetar-2022.2.0[${PYTHON_USEDEP}] )
	baidu? ( ~dev-python/baidu-aip-1.6.6.0[${PYTHON_USEDEP}] )
	beewi_smartclim? ( ~dev-python/beewi-smartclim-0.0.10[${PYTHON_USEDEP}] )
	bh1750? ( ~dev-python/i2csense-0.0.4[${PYTHON_USEDEP}] ~dev-python/smbus-cffi-0.5.1[${PYTHON_USEDEP}] )
	bitcoin? ( ~dev-python/blockchain-1.4.4[${PYTHON_USEDEP}] )
	bizkaibus? ( ~dev-python/bizkaibus-0.1.1[${PYTHON_USEDEP}] )
	blackbird? ( ~dev-python/pyblackbird-0.5[${PYTHON_USEDEP}] )
	blebox? ( ~dev-python/blebox-uniapi-2.0.2[${PYTHON_USEDEP}] )
	blink? ( ~dev-python/blinkpy-0.19.2[${PYTHON_USEDEP}] )
	blinksticklight? ( ~dev-python/BlinkStick-1.2.0[${PYTHON_USEDEP}] )
	blinkt? ( ~dev-python/blinkt-0.1.0[${PYTHON_USEDEP}] )
	blockchain? ( ~dev-python/python-blockchain-api-0.0.2[${PYTHON_USEDEP}] )
	bluetooth? ( ~dev-python/bleak-0.18.1[${PYTHON_USEDEP}] ~dev-python/bleak-retry-connector-2.1.3[${PYTHON_USEDEP}] ~dev-python/bluetooth-adapters-0.6.0[${PYTHON_USEDEP}] ~dev-python/bluetooth-auto-recovery-0.3.4[${PYTHON_USEDEP}] ~dev-python/dbus-fast-1.24.0[${PYTHON_USEDEP}] )
	bluetooth_le_tracker? ( ~dev-python/pygatt-4.0.5[${PYTHON_USEDEP}] )
	bluetooth_tracker? ( ~dev-python/bt-proximity-0.2.1[${PYTHON_USEDEP}] ~dev-python/pybluez-0.22[${PYTHON_USEDEP}] )
	bme280? ( ~dev-python/i2csense-0.0.4[${PYTHON_USEDEP}] ~dev-python/smbus-cffi-0.5.1[${PYTHON_USEDEP}] ~dev-python/bme280spi-0.2.0[${PYTHON_USEDEP}] )
	bme680? ( ~dev-python/bme680-1.0.5[${PYTHON_USEDEP}] ~dev-python/smbus-cffi-0.5.1[${PYTHON_USEDEP}] )
	bmw_connected_drive? ( ~dev-python/bimmer-connected-0.10.4[${PYTHON_USEDEP}] )
	bond? ( ~dev-python/bond-async-0.1.22[${PYTHON_USEDEP}] )
	braviatv? ( ~dev-python/pybravia-0.2.3[${PYTHON_USEDEP}] )
	broadlink? ( ~dev-python/broadlink-0.18.2[${PYTHON_USEDEP}] )
	brother? ( ~dev-python/brother-2.0.0[${PYTHON_USEDEP}] )
	brottsplatskartan? ( ~dev-python/brottsplatskartan-0.0.1[${PYTHON_USEDEP}] )
	brunt? ( ~dev-python/brunt-1.2.0[${PYTHON_USEDEP}] )
	bsblan? ( ~dev-python/bsblan-0.5.0[${PYTHON_USEDEP}] )
	bt_home_hub_5? ( ~dev-python/bthomehub5-devicelist-0.1.1[${PYTHON_USEDEP}] )
	bt_smarthub? ( ~dev-python/btsmarthub-devicelist-0.2.3[${PYTHON_USEDEP}] )
	buienradar? ( ~dev-python/buienradar-1.0.5[${PYTHON_USEDEP}] )
	caldav? ( ~dev-python/caldav-0.9.1[${PYTHON_USEDEP}] )
	camera? ( ~dev-python/PyTurboJPEG-1.6.7[${PYTHON_USEDEP}] )
	canary? ( ~dev-python/py-canary-0.5.3[${PYTHON_USEDEP}] )
	cast? ( ~dev-python/pychromecast-12.1.4[${PYTHON_USEDEP}] )
	cisco_mobility_express? ( ~dev-python/ciscomobilityexpress-0.3.9[${PYTHON_USEDEP}] )
	cli? ( app-misc/home-assistant-cli )
	co2signal? ( ~dev-python/CO2Signal-0.4.2[${PYTHON_USEDEP}] )
	compensation? ( ~dev-python/numpy-1.23.2[${PYTHON_USEDEP}] )
	coronavirus? ( ~dev-python/coronavirus-1.1.1[${PYTHON_USEDEP}] )
	daikin? ( ~dev-python/pydaikin-2.7.2[${PYTHON_USEDEP}] )
	darksky? ( ~dev-python/python-forecastio-1.4.0[${PYTHON_USEDEP}] )
	deconz? ( ~dev-python/pydeconz-104[${PYTHON_USEDEP}] )
	delijn? ( ~dev-python/pydelijn-1.0.0[${PYTHON_USEDEP}] )
	denonavr? ( ~dev-python/denonavr-0.10.11[${PYTHON_USEDEP}] )
	deutsche_bahn? ( ~dev-python/schiene-0.23[${PYTHON_USEDEP}] )
	devolo_home_control? ( ~dev-python/devolo-home-control-api-0.18.2[${PYTHON_USEDEP}] )
	dexcom? ( ~dev-python/pydexcom-0.2.3[${PYTHON_USEDEP}] )
	dhcp? ( ~net-analyzer/scapy-2.4.5 ~dev-python/aiodiscover-1.4.13[${PYTHON_USEDEP}] )
	dht? ( ~dev-python/adafruit-circuitpython-dht-3.7.0[${PYTHON_USEDEP}] ~dev-python/RPi-GPIO-0.7.1_alpha4[${PYTHON_USEDEP}] )
	discogs? ( ~dev-python/discogs-client-2.3.0[${PYTHON_USEDEP}] )
	discord? ( ~dev-python/nextcord-2.0.0_alpha8[${PYTHON_USEDEP}] )
	discovery? ( ~dev-python/netdisco-3.0.0[${PYTHON_USEDEP}] )
	dlna_dmr? ( ~dev-python/async-upnp-client-0.31.2[${PYTHON_USEDEP}] )
	dlna_dms? ( ~dev-python/async-upnp-client-0.31.2[${PYTHON_USEDEP}] )
	doorbird? ( ~dev-python/DoorBirdPy-2.1.0[${PYTHON_USEDEP}] )
	dunehd? ( ~dev-python/pdunehd-1.3.2[${PYTHON_USEDEP}] )
	dwd_weather_warnings? ( ~dev-python/dwdwfsapi-1.0.5[${PYTHON_USEDEP}] )
	dynalite? ( ~dev-python/dynalite-devices-0.1.46[${PYTHON_USEDEP}] )
	dyson? ( ~dev-python/libpurecool-0.6.4[${PYTHON_USEDEP}] )
	ecobee? ( ~dev-python/python-ecobee-api-0.2.14[${PYTHON_USEDEP}] )
	emulated_roku? ( ~dev-python/emulated-roku-0.2.1[${PYTHON_USEDEP}] )
	enigma2? ( ~dev-python/openwebifpy-3.2.7[${PYTHON_USEDEP}] )
	enocean? ( ~dev-python/enocean-0.50.1[${PYTHON_USEDEP}] )
	enphase_envoy? ( ~dev-python/envoy-reader-0.20.1[${PYTHON_USEDEP}] )
	environment_canada? ( ~dev-python/env-canada-0.5.22[${PYTHON_USEDEP}] )
	esphome? ( ~dev-python/aioesphomeapi-11.1.1[${PYTHON_USEDEP}] )
	everlights? ( ~dev-python/pyeverlights-0.1.0[${PYTHON_USEDEP}] )
	evohome? ( ~dev-python/evohome-async-0.3.15[${PYTHON_USEDEP}] )
	ffmpeg? ( ~dev-python/ha-ffmpeg-3.0.2[${PYTHON_USEDEP}] )
	fibaro? ( ~dev-python/fiblary3-0.1.8[${PYTHON_USEDEP}] )
	file? ( ~dev-python/file-read-backwards-2.0.0[${PYTHON_USEDEP}] )
	flume? ( ~dev-python/PyFlume-0.6.5[${PYTHON_USEDEP}] )
	flunearyou? ( ~dev-python/pyflunearyou-2.0.2[${PYTHON_USEDEP}] )
	flux_led? ( ~dev-python/flux-led-0.28.32[${PYTHON_USEDEP}] )
	foobot? ( ~dev-python/foobot_async-1.0.0[${PYTHON_USEDEP}] )
	forecast_solar? ( ~dev-python/forecast-solar-2.2.0[${PYTHON_USEDEP}] )
	fortios? ( ~dev-python/fortiosapi-1.0.5[${PYTHON_USEDEP}] )
	freebox? ( ~dev-python/freebox-api-0.0.10[${PYTHON_USEDEP}] )
	fritz? ( ~dev-python/fritzconnection-1.10.3[${PYTHON_USEDEP}] ~dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}] )
	fritzbox? ( ~dev-python/pyfritzhome-0.6.7[${PYTHON_USEDEP}] )
	fritzbox_callmonitor? ( ~dev-python/fritzconnection-1.10.3[${PYTHON_USEDEP}] )
	fritzbox_netmonitor? ( ~dev-python/fritzconnection-1.4.2[${PYTHON_USEDEP}] )
	fronius? ( ~dev-python/PyFronius-0.7.1[${PYTHON_USEDEP}] )
	garmin_connect? ( ~dev-python/garminconnect-ha-0.1.6[${PYTHON_USEDEP}] )
	gios? ( ~dev-python/gios-2.1.0[${PYTHON_USEDEP}] )
	github? ( ~dev-python/aiogithubapi-22.2.4[${PYTHON_USEDEP}] )
	gogogate2? ( ~dev-python/ismartgate-4.0.4[${PYTHON_USEDEP}] )
	greeneye_monitor? ( ~dev-python/greeneye-monitor-3.0.3[${PYTHON_USEDEP}] )
	growatt_server? ( ~dev-python/growattServer-1.2.2[${PYTHON_USEDEP}] )
	guardian? ( ~dev-python/aioguardian-2022.7.0[${PYTHON_USEDEP}] )
	harman_kardon_avr? ( ~dev-python/hkavr-0.0.5[${PYTHON_USEDEP}] )
	harmony? ( ~dev-python/aioharmony-0.2.9[${PYTHON_USEDEP}] )
	heos? ( ~dev-python/pyheos-0.7.2[${PYTHON_USEDEP}] )
	here_travel_time? ( ~dev-python/herepy-2.0.0[${PYTHON_USEDEP}] )
	homekit? ( ~dev-python/ha-HAP-python-4.5.2[${PYTHON_USEDEP}] ~dev-python/fnvhash-0.1.0[${PYTHON_USEDEP}] ~dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}] ~dev-python/base36-0.1.1[${PYTHON_USEDEP}] )
	homekit_controller? ( ~dev-python/aiohomekit-2.0.1[${PYTHON_USEDEP}] )
	homematic? ( ~dev-python/pyhomematic-0.1.77[${PYTHON_USEDEP}] )
	homematicip_cloud? ( ~dev-python/homematicip-1.0.7[${PYTHON_USEDEP}] )
	hp_ilo? ( ~dev-python/python-hpilo-4.3[${PYTHON_USEDEP}] )
	http? ( ~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}] )
	hue? ( ~dev-python/aiohue-4.5.0[${PYTHON_USEDEP}] )
	hydrawise? ( ~dev-python/Hydrawiser-0.2[${PYTHON_USEDEP}] )
	iaqualink? ( ~dev-python/iaqualink-0.4.1[${PYTHON_USEDEP}] )
	ihc? ( ~dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}] ~dev-python/ihcsdk-2.7.6[${PYTHON_USEDEP}] )
	imap? ( ~dev-python/aioimaplib-1.0.1[${PYTHON_USEDEP}] )
	incomfort? ( ~dev-python/incomfort-client-0.4.4[${PYTHON_USEDEP}] )
	influxdb? ( ~dev-python/influxdb-5.3.1[${PYTHON_USEDEP}] ~dev-python/influxdb-client-1.24.0[${PYTHON_USEDEP}] )
	insteon? ( ~dev-python/pyinsteon-1.2.0[${PYTHON_USEDEP}] ~dev-python/insteon-frontend-home-assistant-0.2.0[${PYTHON_USEDEP}] )
	intesishome? ( ~dev-python/pyintesishome-1.8.0[${PYTHON_USEDEP}] )
	ipma? ( ~dev-python/pyipma-3.0.5[${PYTHON_USEDEP}] )
	ipp? ( ~dev-python/pyipp-0.11.0[${PYTHON_USEDEP}] )
	islamic_prayer_times? ( ~dev-python/prayer-times-calculator-0.0.6[${PYTHON_USEDEP}] )
	jewish_calendar? ( ~dev-python/hdate-0.10.4[${PYTHON_USEDEP}] )
	joaoapps_join? ( ~dev-python/python-join-api-0.0.9[${PYTHON_USEDEP}] )
	kef? ( ~dev-python/aiokef-0.2.16[${PYTHON_USEDEP}] ~dev-python/getmac-0.8.2[${PYTHON_USEDEP}] )
	knx? ( ~dev-python/xknx-1.1.0[${PYTHON_USEDEP}] )
	kodi? ( ~dev-python/pykodi-0.2.7[${PYTHON_USEDEP}] )
	kraken? ( ~dev-python/krakenex-2.1.0[${PYTHON_USEDEP}] ~dev-python/pykrakenapi-0.1.8[${PYTHON_USEDEP}] )
	lifx? ( ~dev-python/aiolifx-0.8.5[${PYTHON_USEDEP}] ~dev-python/aiolifx-effects-0.2.2[${PYTHON_USEDEP}] )
	linode? ( ~dev-python/linode-api-4.1.9_beta1[${PYTHON_USEDEP}] )
	litterrobot? ( ~dev-python/pylitterbot-2022.9.6[${PYTHON_USEDEP}] )
	loopenergy? ( ~dev-python/pyloopenergy-0.2.1[${PYTHON_USEDEP}] )
	luci? ( ~dev-python/openwrt-luci-rpc-1.1.11[${PYTHON_USEDEP}] )
	luftdaten? ( ~dev-python/luftdaten-0.7.2[${PYTHON_USEDEP}] )
	mariadb? ( dev-python/mysqlclient[${PYTHON_USEDEP}] )
	maxcube? ( ~dev-python/maxcube-api-0.4.3[${PYTHON_USEDEP}] )
	media_extractor? ( ~net-misc/youtube-dl-2021.12.17 )
	meteo_france? ( ~dev-python/meteofrance-api-1.0.2[${PYTHON_USEDEP}] )
	mfi? ( ~dev-python/mficlient-0.3.0[${PYTHON_USEDEP}] )
	mikrotik? ( ~dev-python/librouteros-3.2.0[${PYTHON_USEDEP}] )
	mobile_app? ( ~dev-python/pynacl-1.5.0[${PYTHON_USEDEP}] )
	modbus? ( ~dev-python/pymodbus-2.5.3[${PYTHON_USEDEP}] )
	mosquitto? ( app-misc/mosquitto )
	mqtt? ( ~dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}] )
	myq? ( ~dev-python/pymyq-3.1.4[${PYTHON_USEDEP}] )
	mysql? ( dev-python/mysqlclient[${PYTHON_USEDEP}] )
	nad? ( ~dev-python/nad-receiver-0.3.0[${PYTHON_USEDEP}] )
	nederlandse_spoorwegen? ( ~dev-python/nsapi-3.0.5[${PYTHON_USEDEP}] )
	netatmo? ( ~dev-python/pyatmo-7.1.1[${PYTHON_USEDEP}] )
	netdata? ( ~dev-python/netdata-1.0.1[${PYTHON_USEDEP}] )
	notify_events? ( ~dev-python/notify-events-1.0.4[${PYTHON_USEDEP}] )
	nuki? ( ~dev-python/pynuki-1.5.2[${PYTHON_USEDEP}] )
	nws? ( ~dev-python/pynws-1.4.1[${PYTHON_USEDEP}] )
	nx584? ( ~dev-python/pynx584-0.5[${PYTHON_USEDEP}] )
	octoprint? ( ~dev-python/pyoctoprintapi-0.1.8[${PYTHON_USEDEP}] )
	onkyo? ( ~dev-python/onkyo-eiscp-1.2.7[${PYTHON_USEDEP}] )
	onvif? ( ~dev-python/onvif-zeep-async-1.2.1[${PYTHON_USEDEP}] ~dev-python/WSDiscovery-2.0.0[${PYTHON_USEDEP}] )
	opengarage? ( ~dev-python/open-garage-0.2.0[${PYTHON_USEDEP}] )
	opensensemap? ( ~dev-python/opensensemap-api-0.2.0[${PYTHON_USEDEP}] )
	openweathermap? ( ~dev-python/pyowm-3.2.0[${PYTHON_USEDEP}] )
	opnsense? ( ~dev-python/pyopnsense-0.2.0[${PYTHON_USEDEP}] )
	otp? ( ~dev-python/pyotp-2.7.0[${PYTHON_USEDEP}] )
	owntracks? ( ~dev-python/pynacl-1.5.0[${PYTHON_USEDEP}] )
	panasonic_viera? ( ~dev-python/panasonic-viera-0.3.6[${PYTHON_USEDEP}] )
	philips_js? ( ~dev-python/ha-philipsjs-2.9.0[${PYTHON_USEDEP}] )
	pilight? ( ~dev-python/pilight-0.1.1[${PYTHON_USEDEP}] )
	ping? ( ~dev-python/icmplib-3.0[${PYTHON_USEDEP}] )
	pi_hole? ( ~dev-python/hole-0.7.0[${PYTHON_USEDEP}] )
	plex? ( ~dev-python/PlexAPI-4.13.0[${PYTHON_USEDEP}] ~dev-python/plexauth-0.0.6[${PYTHON_USEDEP}] ~dev-python/plexwebsocket-0.0.13[${PYTHON_USEDEP}] )
	plugwise? ( ~dev-python/plugwise-0.21.3[${PYTHON_USEDEP}] )
	poolsense? ( ~dev-python/poolsense-0.0.8[${PYTHON_USEDEP}] )
	powerwall? ( ~dev-python/tesla-powerwall-0.3.18[${PYTHON_USEDEP}] )
	ps4? ( ~dev-python/pyps4-2ndscreen-1.3.1[${PYTHON_USEDEP}] )
	python_script? ( ~dev-python/RestrictedPython-5.2[${PYTHON_USEDEP}] )
	qnap? ( ~dev-python/qnapstats-0.4.0[${PYTHON_USEDEP}] )
	qvr_pro? ( ~dev-python/pyqvrpro-0.52[${PYTHON_USEDEP}] )
	rachio? ( ~dev-python/RachioPy-1.0.3[${PYTHON_USEDEP}] )
	radio_browser? ( ~dev-python/radios-0.1.1[${PYTHON_USEDEP}] )
	rainbird? ( ~dev-python/pyrainbird-0.4.3[${PYTHON_USEDEP}] )
	rainmachine? ( ~dev-python/regenmaschine-2022.9.2[${PYTHON_USEDEP}] )
	recorder? ( ~dev-python/sqlalchemy-1.4.41[${PYTHON_USEDEP}] ~dev-python/fnvhash-0.1.0[${PYTHON_USEDEP}] )
	rejseplanen? ( ~dev-python/rjpl-0.3.6[${PYTHON_USEDEP}] )
	rest? ( ~dev-python/jsonpath-0.82[${PYTHON_USEDEP}] ~dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}] )
	ring? ( ~dev-python/ring-doorbell-0.7.2[${PYTHON_USEDEP}] )
	roku? ( ~dev-python/rokuecp-0.17.0[${PYTHON_USEDEP}] )
	roomba? ( ~dev-python/roombapy-1.6.5[${PYTHON_USEDEP}] )
	roon? ( ~dev-python/roonapi-0.1.1[${PYTHON_USEDEP}] )
	samsungtv? ( ~dev-python/getmac-0.8.2[${PYTHON_USEDEP}] ~dev-python/samsungctl-0.7.1[${PYTHON_USEDEP}] ~dev-python/samsungtvws-2.5.0[${PYTHON_USEDEP}] ~dev-python/wakeonlan-2.1.0[${PYTHON_USEDEP}] ~dev-python/async-upnp-client-0.31.2[${PYTHON_USEDEP}] )
	scrape? ( ~dev-python/beautifulsoup4-4.11.1[${PYTHON_USEDEP}] ~dev-python/lxml-4.9.1[${PYTHON_USEDEP}] )
	season? ( ~dev-python/ephem-4.1.2[${PYTHON_USEDEP}] )
	shelly? ( ~dev-python/aioshelly-2.0.2[${PYTHON_USEDEP}] )
	shodan? ( ~dev-python/shodan-1.28.0[${PYTHON_USEDEP}] )
	signal_messenger? ( ~dev-python/pysignalclirestapi-0.3.18[${PYTHON_USEDEP}] )
	simplisafe? ( ~dev-python/simplisafe-python-2022.7.1[${PYTHON_USEDEP}] )
	skybell? ( ~dev-python/aioskybell-22.7.0[${PYTHON_USEDEP}] )
	sma? ( ~dev-python/pysma-0.6.12[${PYTHON_USEDEP}] )
	smappee? ( ~dev-python/pysmappee-0.2.29[${PYTHON_USEDEP}] )
	smarthab? ( ~dev-python/SmartHab-0.21[${PYTHON_USEDEP}] )
	smartthings? ( ~dev-python/pysmartapp-0.3.3[${PYTHON_USEDEP}] ~dev-python/pysmartthings-0.7.6[${PYTHON_USEDEP}] )
	snmp? ( ~dev-python/pysnmplib-5.0.15[${PYTHON_USEDEP}] )
	socat? ( net-misc/socat )
	solax? ( ~dev-python/solax-0.3.0[${PYTHON_USEDEP}] )
	somfy? ( ~dev-python/pymfy-0.11.0[${PYTHON_USEDEP}] )
	sonos? ( ~dev-python/soco-0.28.0[${PYTHON_USEDEP}] )
	speedtestdotnet? ( ~net-analyzer/speedtest-cli-2.1.3[${PYTHON_USEDEP}] )
	spotify? ( ~dev-python/spotipy-2.20.0[${PYTHON_USEDEP}] )
	sql? ( ~dev-python/sqlalchemy-1.4.41[${PYTHON_USEDEP}] )
	squeezebox? ( ~dev-python/pysqueezebox-0.6.0[${PYTHON_USEDEP}] )
	ssl? ( dev-libs/openssl app-crypt/certbot net-proxy/haproxy )
	statsd? ( ~dev-python/statsd-3.2.1[${PYTHON_USEDEP}] )
	synology_dsm? ( ~dev-python/py-synologydsm-api-1.0.8[${PYTHON_USEDEP}] )
	systemmonitor? ( ~dev-python/psutil-5.9.2[${PYTHON_USEDEP}] )
	tankerkoenig? ( ~dev-python/pytankerkoenig-0.0.6[${PYTHON_USEDEP}] )
	tasmota? ( ~dev-python/HATasmota-0.6.1[${PYTHON_USEDEP}] )
	tellduslive? ( ~dev-python/tellduslive-0.10.11[${PYTHON_USEDEP}] )
	tesla? ( ~dev-python/teslajsonpy-0.18.3[${PYTHON_USEDEP}] )
	tile? ( ~dev-python/pytile-2022.2.0[${PYTHON_USEDEP}] )
	tomorrowio? ( ~dev-python/pytomorrowio-0.3.5[${PYTHON_USEDEP}] )
	toon? ( ~dev-python/toonapi-0.2.1[${PYTHON_USEDEP}] )
	totalconnect? ( ~dev-python/total-connect-client-2022.10[${PYTHON_USEDEP}] )
	tplink? ( ~dev-python/python-kasa-0.5.0[${PYTHON_USEDEP}] )
	tuya? ( ~dev-python/tuya-iot-py-sdk-0.6.6[${PYTHON_USEDEP}] )
	unifi? ( ~dev-python/aiounifi-39[${PYTHON_USEDEP}] )
	unifi_direct? ( ~dev-python/pexpect-4.6.0[${PYTHON_USEDEP}] )
	upnp? ( ~dev-python/async-upnp-client-0.31.2[${PYTHON_USEDEP}] ~dev-python/getmac-0.8.2[${PYTHON_USEDEP}] )
	utility_meter? ( ~dev-python/croniter-1.0.6[${PYTHON_USEDEP}] )
	vallox? ( ~dev-python/vallox-websocket-api-2.12.0[${PYTHON_USEDEP}] )
	velbus? ( ~dev-python/velbus-aio-2022.10.2[${PYTHON_USEDEP}] )
	velux? ( ~dev-python/pyvlx-0.2.20[${PYTHON_USEDEP}] )
	vera? ( ~dev-python/pyvera-0.3.13[${PYTHON_USEDEP}] )
	version? ( ~dev-python/pyhaversion-22.8.0[${PYTHON_USEDEP}] )
	vicare? ( ~dev-python/PyViCare-2.17.0[${PYTHON_USEDEP}] )
	vizio? ( ~dev-python/pyvizio-0.1.57[${PYTHON_USEDEP}] )
	wake_on_lan? ( ~dev-python/wakeonlan-2.1.0[${PYTHON_USEDEP}] )
	waqi? ( ~dev-python/waqiasync-1.0.0[${PYTHON_USEDEP}] )
	waze_travel_time? ( ~dev-python/WazeRouteCalculator-0.14[${PYTHON_USEDEP}] )
	webostv? ( ~dev-python/aiowebostv-0.2.1[${PYTHON_USEDEP}] )
	wemo? ( ~dev-python/pywemo-0.9.1[${PYTHON_USEDEP}] )
	whois? ( ~dev-python/whois-0.9.16[${PYTHON_USEDEP}] )
	wink? ( ~dev-python/pubnubsub-handler-1.0.9[${PYTHON_USEDEP}] ~dev-python/python-wink-1.10.5[${PYTHON_USEDEP}] )
	withings? ( ~dev-python/withings-api-2.4.0[${PYTHON_USEDEP}] )
	wled? ( ~dev-python/wled-0.14.1[${PYTHON_USEDEP}] )
	workday? ( ~dev-python/holidays-0.16[${PYTHON_USEDEP}] )
	xbox_live? ( ~dev-python/xboxapi-2.0.1[${PYTHON_USEDEP}] )
	xiaomi_aqara? ( ~dev-python/PyXiaomiGateway-0.14.1[${PYTHON_USEDEP}] )
	xiaomi_miio? ( ~dev-python/construct-2.10.56[${PYTHON_USEDEP}] ~dev-python/micloud-0.5[${PYTHON_USEDEP}] ~dev-python/python-miio-0.5.12[${PYTHON_USEDEP}] )
	xiaomi_tv? ( ~dev-python/pymitv-1.4.3[${PYTHON_USEDEP}] )
	xs1? ( ~dev-python/xs1-api-client-3.0.0[${PYTHON_USEDEP}] )
	yamaha? ( ~dev-python/rxv-0.7.0[${PYTHON_USEDEP}] )
	yamaha_musiccast? ( ~dev-python/aiomusiccast-0.14.4[${PYTHON_USEDEP}] )
	yeelight? ( ~dev-python/yeelight-0.7.10[${PYTHON_USEDEP}] ~dev-python/async-upnp-client-0.31.2[${PYTHON_USEDEP}] )
	yi? ( ~dev-python/aioftp-0.21.3[${PYTHON_USEDEP}] )
	zeroconf? ( ~dev-python/python-zeroconf-0.39.1[${PYTHON_USEDEP}] )
	zerproc? ( ~dev-python/pyzerproc-0.4.8[${PYTHON_USEDEP}] )
	zha? ( ~dev-python/bellows-0.34.2[${PYTHON_USEDEP}] ~dev-python/pyserial-3.5[${PYTHON_USEDEP}] ~dev-python/pyserial-asyncio-0.6[${PYTHON_USEDEP}] ~dev-python/zha-quirks-0.0.82[${PYTHON_USEDEP}] ~dev-python/zigpy-deconz-0.19.0[${PYTHON_USEDEP}] ~dev-python/zigpy-0.51.3[${PYTHON_USEDEP}] ~dev-python/zigpy-xbee-0.16.2[${PYTHON_USEDEP}] ~dev-python/zigpy-zigate-0.10.2[${PYTHON_USEDEP}] ~dev-python/zigpy-znp-0.9.1[${PYTHON_USEDEP}] )
	zhong_hong? ( ~dev-python/zhong-hong-hvac-1.0.9[${PYTHON_USEDEP}] )
	zoneminder? ( ~dev-python/zm-py-0.5.2[${PYTHON_USEDEP}] )
	zwave_js? ( ~dev-python/pyserial-3.5[${PYTHON_USEDEP}] ~dev-python/zwave-js-server-python-0.43.0[${PYTHON_USEDEP}] )"

BDEPEND="${RDEPEND}
	test? (
		~dev-python/astroid-2.12.5[${PYTHON_USEDEP}]
		~dev-python/codecov-2.1.12[${PYTHON_USEDEP}]
		~dev-python/coverage-6.4.4[${PYTHON_USEDEP}]
		~dev-python/freezegun-1.2.1[${PYTHON_USEDEP}]
		~dev-python/mock-open-1.4.0[${PYTHON_USEDEP}]
		~dev-python/mypy-0.981[${PYTHON_USEDEP}]
		<dev-python/pip-22.1.0
		~dev-vcs/pre-commit-2.20.0
		~dev-python/pylint-2.15.0[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
		~dev-python/pytest-freezegun-0.4.2[${PYTHON_USEDEP}]
		~dev-python/pytest-socket-0.5.1[${PYTHON_USEDEP}]
		~dev-python/pytest-sugar-0.9.5[${PYTHON_USEDEP}]
		~dev-python/pytest-test-groups-1.0.3[${PYTHON_USEDEP}]
		~dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}]
		~dev-python/pytest-xdist-2.5.0[${PYTHON_USEDEP}]
		~dev-python/pytest-7.1.3[${PYTHON_USEDEP}]
		~dev-python/requests-mock-1.10.0[${PYTHON_USEDEP}]
		~dev-python/respx-0.19.2[${PYTHON_USEDEP}]
		~dev-python/stdlib-list-0.7.0[${PYTHON_USEDEP}]
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

distutils_enable_tests pytest

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7,8} )
inherit readme.gentoo-r1 eutils distutils-r1

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

DESCRIPTION="Open-source home automation platform running on Python 3.7 & 3.8"
HOMEPAGE="https://home-assistant.io/ https://git.edevau.net/onkelbeh/HomeAssistantRepository/"

LICENSE="Apache-2.0"
SLOT="0"

KEYWORDS="amd64 arm64 x86 amd64-linux x86-linux"
IUSE="abode accuweather acer_projector acmeda adguard ads aftership agent_dvr airly airvisual aladdin_connect alarmdecoder almond alpha_vantage amazon_polly ambiclimate ambient_station amcrest ampio androidtv android_ip_webcam anel_pwrctrl anthemav apache_kafka apcupsd apns apple_tv apprise aprs aqualogic aquostv arcam_fmj arduino arlo arris_tg2492lg aruba asterisk_mbox asuswrt atag aten_pe atome august aurora_abb_powerone avea avion -avri awair -aws axis azure_devops azure_event_hub azure_service_bus baidu bbb_gpio bbox -beewi_smartclim bh1750 bitcoin bizkaibus blackbird blebox blink blinksticklight blinkt blockchain bluesound bluetooth_le_tracker bluetooth_tracker bme280 bme680 bmp280 bmw_connected_drive bom bond braviatv broadlink brother brottsplatskartan brunt bsblan bt_home_hub_5 bt_smarthub buienradar +caldav canary cast channels circuit cisco_ios cisco_mobility_express cisco_webex_teams clementine cli cloud cloudflare cmus co2signal coinbase coinmarketcap comfoconnect concord232 control4 coolmaster coronavirus cppm_tracker cpuspeed crimereports cups daikin danfoss_air darksky datadog debugpy deconz decora decora_wifi delijn deluge denonavr deutsche_bahn devolo_home_control dexcom dht digitalloggers digital_ocean directv discogs discord discovery dlib_face_detect dlib_face_identify dlink dlna_dmr dnsip dominos doods doorbird dovado dsmr dunehd +dwd_weather_warnings dweet dynalite dyson eafm ebox ebusd ecoal_boiler ecobee econet ecovacs eddystone_temperature edimax edl21 ee_brightbox egardia eight_sleep elgato eliqonline elkm1 elv emby emulated_hue emulated_kasa emulated_roku enigma2 enocean enphase_envoy entur_public_transport environment_canada envirophat envisalink ephember epson epsonworkforce eq3btsmart esphome essent etherscan eufy everlights evohome ezviz familyhub fastdotcom feedreader ffmpeg fibaro fido fints firmata fitbit fixer fleetgo flexit flic flick_electric flo flume flunearyou flux_led folder_watcher foobot forked_daapd fortios foscam freebox free_mobile fritz fritzbox fritzbox_callmonitor fritzbox_netmonitor fronius frontend frontier_silicon futurenow garmin_connect gc100 gdacs geizhals geniushub geonetnz_quakes geonetnz_volcano geo_json_events geo_rss_events gios github gitlab_ci gitter glances -gntp goalfeed gogogate2 google google_cloud google_maps google_pubsub google_translate google_travel_time gpmdp -gpsd greeneye_monitor greenwave griddy growatt_server gstreamer gtfs guardian habitica hangouts harman_kardon_avr harmony hdmi_cec heatmiser heos here_travel_time hikvision hikvisioncam hisense_aehw4a1 hive hlk_sw16 homekit homekit_controller -homematic -homematicip_cloud homeworks home_connect honeywell horizon hp_ilo html5 http htu21d huawei_lte hue hunterdouglas_powerview hvv_departures hydrawise ialarm iammeter iaqualink -icloud idteck_prox ifttt iglo ign_sismologia ihc image imap incomfort influxdb insteon intesishome iota iperf3 ipma ipp iqvia irish_rail_transport islamic_prayer_times iss isy994 itach izone jewish_calendar joaoapps_join juicenet kaiterra keba keenetic_ndms2 kef keyboard keyboard_remote kira kiwi knx kodi konnected kwb lacrosse lametric lastfm launch_library lcn lg_netcast lg_soundbar life360 lifx lifx_legacy lightwave limitlessled linode linux_battery lirc litejet logi_circle london_underground loopenergy luci luftdaten lupusec lutron lutron_caseta lw12wifi lyft magicseaweed mailgun marytts mastodon matrix maxcube maxcube_hack mcp23017 mediaroom media_extractor melcloud melissa message_bird met meteoalarm meteo_france metoffice mfi mhz19 microsoft miflora mikrotik mill minecraft_server minio -mitemp_bt mobile_app mochad modbus modem_callerid monoprice mpd +mqtt msteams mvglive mychevy mycroft myq mysensors +mysql mystrom mythicbeastsdns n26 nad namecheapdns nanoleaf neato nederlandse_spoorwegen nello ness_alarm nest netatmo netdata netgear netgear_lte netio neurio_energy nexia nextbus nextcloud nightscout niko_home_control nilu nissan_leaf nmap_tracker nmbs noaa_tides norway_air notify_events notion nsw_fuel_station nsw_rural_fire_service_feed nuheat nuimo_controller nuki numato nut nws nx584 nzbget oasa_telematics obihai oem ohmconnect ombi onewire onkyo onvif opencv openerz openevse opengarage openhome opensensemap opentherm_gw openuv openweathermap opnsense opple orangepi_gpio oru orvibo osramlightify +otp ovo_energy owntracks ozw panasonic_bluray panasonic_viera pandora pcal9535a pencom philips_js pi4ioe5v9xxxx piglow pilight +ping pi_hole pjlink plex plugwise plum_lightpad pocketcasts point poolsense powerwall progettihwsw proliphix prometheus proxmoxve proxy ps4 ptvsd pulseaudio_loopback pushbullet pushover pvpc_hourly_pricing python_script qbittorrent qld_bushfire qnap qrcode quantum_gateway qvr_pro qwikswitch rachio radiotherm rainbird raincloud rainforest_eagle rainmachine raspihats raspyrfm recollect_waste +recorder recswitch reddit rejseplanen -remember_the_milk remote_rpi_gpio repetier +rest rflink rfxtrx ring ripple risco rmvtransport rocketchat roku roomba roon route53 rova rpi_gpio rpi_gpio_pwm rpi_pfio rpi_rf russound_rio russound_rnet sabnzbd saj salt samsungtv satel_integra schluter +scrape scsgate season sendgrid sense sensehat sensibo sentry serial serial_pm sesame seventeentrack seven_segments sharkiq shelly shiftr shodan sht31 sighthound signal_messenger simplepush simplisafe sinch sisyphus skybeacon skybell sky_hub slack sleepiq slide sma smappee smarthab smartthings smarty smart_meter_texas smhi sms snapcast +snmp socat sochain socialblade solaredge solaredge_local solarlog solax soma somfy somfy_mylink sonarr songpal sonos sony_projector soundtouch spc speedtestdotnet spider spotcrime spotify +sql squeezebox ssdp +ssl starline starlingbank startca statsd steam_online stiebel_eltron stookalert stream streamlabswater suez_water supla surepetcare swiss_hydrological_data swiss_public_transport switchbot switcher_kis switchmate syncthru synology synology_dsm synology_srm systemmonitor tado tag tahoma tankerkoenig tank_utility tapsaff tautulli ted5000 telegram_bot tellduslive tellstick temper tensorflow tesla test tfiac thermoworks_smoke thingspeak thinkingcleaner tibber tikteck tile tmb todoist tof toon totalconnect touchline tplink tplink_lte traccar trackr tradfri trafikverket_train trafikverket_weatherstation transmission transport_nsw travisci trend tts tuya twentemilieu twilio twitch twitter ubee unifi unifiled unifi_direct upb upcloud upc_connect updater upnp uptimerobot uscis usgs_earthquakes_feed uvc vallox vasttrafik velbus velux venstar vera verisure versasense +version vesync vicare vilfo vivotek vizio vlc vlc_telnet volkszaehler volumio volvooncall vultr w800rf32 wake_on_lan waqi waterfurnace watson_iot watson_tts waze_travel_time webostv wemo whois wiffi wilight wink wirelesstag withings wled wolflink workday xbee xbox_live xeoma xfinity xiaomi_aqara xiaomi_miio xiaomi_tv xmpp xs1 yale_smart_alarm yamaha yamaha_musiccast yandex_transport yeelight yeelightsunflower yessssms yi zabbix zengge zeroconf zerproc zestimate zha zhong_hong ziggo_mediabox_xl zoneminder +zwave"

# external deps
RDEPEND="${PYTHON_DEPS} acct-group/${MY_PN} acct-user/${MY_PN}
	|| ( dev-lang/python:3.7 dev-lang/python:3.8 )
        app-admin/logrotate
	dev-db/sqlite
	dev-libs/libfastjson
	>=dev-libs/xerces-c-3.1.4-r1"

# make sure no conflicting main Ebuild is installed
RDEPEND="${RDEPEND}
	!app-misc/homeassistant-min
	!app-misc/homeassistant"

# Home Assistant Core dependencies
# from package_constraints.txt
RDEPEND="${RDEPEND}
	~dev-python/aiohttp-3.6.2[${PYTHON_USEDEP}]
	~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	~dev-python/astral-1.10.1[${PYTHON_USEDEP}]
	~dev-python/async_timeout-3.0.1[${PYTHON_USEDEP}]
	~dev-python/attrs-19.3.0[${PYTHON_USEDEP}]
	~dev-python/bcrypt-3.1.7[${PYTHON_USEDEP}]
	>=dev-python/btlewrap-0.0.10[${PYTHON_USEDEP}]
	>=dev-python/certifi-2020.6.20[${PYTHON_USEDEP}]
	~dev-python/ciso8601-2.1.3[${PYTHON_USEDEP}]
	~dev-python/cryptography-2.9.2[${PYTHON_USEDEP}]
	~dev-python/defusedxml-0.6.0[${PYTHON_USEDEP}]
	~dev-python/distro-1.5.0[${PYTHON_USEDEP}]
	~dev-python/emoji-0.5.4[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.37.0[${PYTHON_USEDEP}]
	~dev-python/home-assistant-frontend-20200918.2[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.18.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '~dev-python/importlib-metadata-1.6.0[${PYTHON_USEDEP}]' python3_7)
	~dev-python/jinja-2.11.2[${PYTHON_USEDEP}]
	~dev-python/netdisco-2.8.2[${PYTHON_USEDEP}]
	~dev-python/paho-mqtt-1.5.0[${PYTHON_USEDEP}]
	~dev-python/pillow-7.2.0[${PYTHON_USEDEP}]
	>=dev-python/pip-8.0.3[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.6.6[${PYTHON_USEDEP}]
	~dev-python/pyjwt-1.7.1[${PYTHON_USEDEP}]
	~dev-python/pynacl-1.3.0[${PYTHON_USEDEP}]
	~dev-python/python-slugify-4.0.1[${PYTHON_USEDEP}]
	>=dev-python/pytz-2020.1[${PYTHON_USEDEP}]
	~dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}]
	~dev-python/requests-2.24.0[${PYTHON_USEDEP}]
	~dev-python/ruamel-yaml-0.15.100[${PYTHON_USEDEP}]
	~dev-python/sqlalchemy-1.3.19[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.24.3[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.4.0[${PYTHON_USEDEP}]
	~dev-python/voluptuous-0.11.7[${PYTHON_USEDEP}]
	~dev-python/yarl-1.4.2[${PYTHON_USEDEP}]
	~dev-python/zeroconf-0.28.5[${PYTHON_USEDEP}]"

# unknown origin, still something to clean up here

RDEPEND="${RDEPEND}
	~dev-python/base36-0.1.1[${PYTHON_USEDEP}]
	~dev-python/colorlog-4.2.1[${PYTHON_USEDEP}]
	~dev-python/fnvhash-0.1.0[${PYTHON_USEDEP}]
	~dev-python/gTTS-token-1.1.3[${PYTHON_USEDEP}]
	~dev-python/HAP-python-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/multidict-4.5.2[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.19.1[${PYTHON_USEDEP}]
	>=dev-python/pycparser-2.19[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}]
	~dev-python/pysnmp-4.4.12[${PYTHON_USEDEP}]
	~dev-python/RestrictedPython-5.0[${PYTHON_USEDEP}]
	>=dev-python/wakeonlan-1.1.6[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.56.0[${PYTHON_USEDEP}]
	~dev-python/xmltodict-0.12.0[${PYTHON_USEDEP}]
	~media-libs/mutagen-1.45.1"

# Module requirements from useflags
RDEPEND="${RDEPEND}
	abode? ( ~dev-python/abodepy-1.1.0[${PYTHON_USEDEP}] )
	accuweather? ( ~dev-python/accuweather-0.0.11[${PYTHON_USEDEP}] )
	acer_projector? ( ~dev-python/pyserial-3.4[${PYTHON_USEDEP}] )
	acmeda? ( ~dev-python/aiopulse-0.4.0[${PYTHON_USEDEP}] )
	adguard? ( ~dev-python/adguardhome-0.4.2[${PYTHON_USEDEP}] )
	ads? ( ~dev-python/pyads-3.2.2[${PYTHON_USEDEP}] )
	aftership? ( ~dev-python/pyaftership-0.1.2[${PYTHON_USEDEP}] )
	agent_dvr? ( ~dev-python/agent-py-0.0.23[${PYTHON_USEDEP}] )
	airly? ( ~dev-python/airly-0.0.2[${PYTHON_USEDEP}] )
	airvisual? ( ~dev-python/pyairvisual-4.4.0[${PYTHON_USEDEP}] )
	aladdin_connect? ( ~dev-python/aladdin-connect-0.3[${PYTHON_USEDEP}] )
	alarmdecoder? ( ~dev-python/adext-0.3[${PYTHON_USEDEP}] )
	almond? ( ~dev-python/pyalmond-0.0.2[${PYTHON_USEDEP}] )
	alpha_vantage? ( ~dev-python/alpha-vantage-2.2.0[${PYTHON_USEDEP}] )
	amazon_polly? ( ~dev-python/boto3-1.9.252[${PYTHON_USEDEP}] )
	ambiclimate? ( ~dev-python/Ambiclimate-0.2.1[${PYTHON_USEDEP}] )
	ambient_station? ( ~dev-python/aioambient-1.2.1[${PYTHON_USEDEP}] )
	amcrest? ( ~dev-python/amcrest-1.7.0[${PYTHON_USEDEP}] )
	ampio? ( ~dev-python/asmog-0.0.6[${PYTHON_USEDEP}] )
	androidtv? ( ~dev-python/adb-shell-0.2.1[${PYTHON_USEDEP}] ~dev-python/androidtv-0.0.50[${PYTHON_USEDEP}] ~dev-python/pure-python-adb-0.3.0[${PYTHON_USEDEP}] )
	android_ip_webcam? ( ~dev-python/pydroid-ipcam-0.8[${PYTHON_USEDEP}] )
	anel_pwrctrl? ( ~dev-python/anel-pwrctrl-homeassistant-0.0.1[${PYTHON_USEDEP}] )
	anthemav? ( ~dev-python/anthemav-1.1.10[${PYTHON_USEDEP}] )
	apache_kafka? ( ~dev-python/aiokafka-0.6.0[${PYTHON_USEDEP}] )
	apcupsd? ( ~dev-python/apcaccess-0.0.13[${PYTHON_USEDEP}] )
	apns? ( ~dev-python/apns2-0.3.0[${PYTHON_USEDEP}] )
	apple_tv? ( ~dev-python/pyatv-0.3.13[${PYTHON_USEDEP}] )
	apprise? ( ~dev-python/apprise-0.8.8[${PYTHON_USEDEP}] )
	aprs? ( ~dev-python/aprslib-0.6.46[${PYTHON_USEDEP}] ~dev-python/geopy-1.21.0[${PYTHON_USEDEP}] )
	aqualogic? ( ~dev-python/aqualogic-1.0[${PYTHON_USEDEP}] )
	aquostv? ( ~dev-python/sharp_aquos_rc-0.3.2[${PYTHON_USEDEP}] )
	arcam_fmj? ( ~dev-python/arcam-fmj-0.5.3[${PYTHON_USEDEP}] )
	arduino? ( ~dev-python/PyMata-2.20[${PYTHON_USEDEP}] )
	arlo? ( ~dev-python/pyarlo-0.2.3[${PYTHON_USEDEP}] )
	arris_tg2492lg? ( ~dev-python/arris-tg2492lg-1.0.0[${PYTHON_USEDEP}] )
	aruba? ( ~dev-python/pexpect-4.6.0[${PYTHON_USEDEP}] )
	asterisk_mbox? ( ~dev-python/asterisk_mbox-0.5.0[${PYTHON_USEDEP}] )
	asuswrt? ( ~dev-python/aioasuswrt-1.2.8[${PYTHON_USEDEP}] )
	atag? ( ~dev-python/pyatag-0.3.3.4[${PYTHON_USEDEP}] )
	aten_pe? ( ~dev-python/atenpdu-0.3.0[${PYTHON_USEDEP}] )
	atome? ( ~dev-python/pyAtome-0.1.1[${PYTHON_USEDEP}] )
	august? ( ~dev-python/py-august-0.25.0[${PYTHON_USEDEP}] )
	aurora_abb_powerone? ( ~dev-python/aurorapy-0.2.6[${PYTHON_USEDEP}] )
	avea? ( ~dev-python/avea-1.4[${PYTHON_USEDEP}] )
	avion? ( ~dev-python/avion-0.10[${PYTHON_USEDEP}] )
	avri? ( ~dev-python/avri-api-0.1.7[${PYTHON_USEDEP}] ~dev-python/pycountry-19.8.18[${PYTHON_USEDEP}] )
	awair? ( ~dev-python/python-awair-0.1.1[${PYTHON_USEDEP}] )
	aws? ( ~dev-python/aiobotocore-0.11.1[${PYTHON_USEDEP}] )
	axis? ( ~dev-python/axis-37[${PYTHON_USEDEP}] )
	azure_devops? ( ~dev-python/aioazuredevops-1.3.5[${PYTHON_USEDEP}] )
	baidu? ( ~dev-python/baidu-aip-1.6.6.0[${PYTHON_USEDEP}] )
	bbb_gpio? ( ~dev-python/Adafruit_BBIO-1.1.1[${PYTHON_USEDEP}] )
	bbox? ( ~dev-python/pybbox-0.0.5_alpha0[${PYTHON_USEDEP}] )
	beewi_smartclim? ( ~dev-python/beewi-smartclim-0.0.7[${PYTHON_USEDEP}] )
	bh1750? ( ~dev-python/i2csense-0.0.4[${PYTHON_USEDEP}] ~dev-python/smbus-cffi-0.5.1[${PYTHON_USEDEP}] )
	bitcoin? ( ~dev-python/blockchain-1.4.4[${PYTHON_USEDEP}] )
	bizkaibus? ( ~dev-python/bizkaibus-0.1.1[${PYTHON_USEDEP}] )
	blackbird? ( ~dev-python/pyblackbird-0.5[${PYTHON_USEDEP}] )
	blebox? ( ~dev-python/blebox-uniapi-1.3.2[${PYTHON_USEDEP}] )
	blink? ( ~dev-python/blinkpy-0.16.3[${PYTHON_USEDEP}] )
	blinksticklight? ( ~dev-python/BlinkStick-1.1.8[${PYTHON_USEDEP}] )
	blinkt? ( ~dev-python/blinkt-0.1.0[${PYTHON_USEDEP}] )
	blockchain? ( ~dev-python/python-blockchain-api-0.0.2[${PYTHON_USEDEP}] )
	bluesound? ( ~dev-python/xmltodict-0.12.0[${PYTHON_USEDEP}] )
	bluetooth_le_tracker? ( ~dev-python/pygatt-4.0.5[${PYTHON_USEDEP}] )
	bluetooth_tracker? ( ~dev-python/bt-proximity-0.2[${PYTHON_USEDEP}] ~dev-python/pybluez-0.22[${PYTHON_USEDEP}] )
	bme280? ( ~dev-python/i2csense-0.0.4[${PYTHON_USEDEP}] ~dev-python/smbus-cffi-0.5.1[${PYTHON_USEDEP}] )
	bme680? ( ~dev-python/bme680-1.0.5[${PYTHON_USEDEP}] ~dev-python/smbus-cffi-0.5.1[${PYTHON_USEDEP}] )
	bmp280? ( ~dev-python/adafruit-circuitpython-bmp280-3.1.1[${PYTHON_USEDEP}] ~dev-python/RPi-GPIO-0.7.0[${PYTHON_USEDEP}] )
	bmw_connected_drive? ( ~dev-python/bimmer-connected-0.7.7[${PYTHON_USEDEP}] )
	bom? ( ~dev-python/bomradarloop-0.1.5[${PYTHON_USEDEP}] )
	bond? ( ~dev-python/bond-api-0.1.8[${PYTHON_USEDEP}] )
	braviatv? ( ~dev-python/bravia-tv-1.0.6[${PYTHON_USEDEP}] )
	broadlink? ( ~dev-python/broadlink-0.14.1[${PYTHON_USEDEP}] )
	brother? ( ~dev-python/brother-0.1.17[${PYTHON_USEDEP}] )
	brottsplatskartan? ( ~dev-python/brottsplatskartan-0.0.1[${PYTHON_USEDEP}] )
	brunt? ( ~dev-python/brunt-0.1.3[${PYTHON_USEDEP}] )
	bsblan? ( ~dev-python/bsblan-0.3.7[${PYTHON_USEDEP}] )
	bt_home_hub_5? ( ~dev-python/bthomehub5-devicelist-0.1.1[${PYTHON_USEDEP}] )
	bt_smarthub? ( ~dev-python/btsmarthub-devicelist-0.2.0[${PYTHON_USEDEP}] )
	buienradar? ( ~dev-python/buienradar-1.0.4[${PYTHON_USEDEP}] )
	caldav? ( ~dev-python/caldav-0.6.1[${PYTHON_USEDEP}] )
	canary? ( ~dev-python/py-canary-0.5.0[${PYTHON_USEDEP}] )
	cast? ( ~dev-python/pychromecast-7.2.1[${PYTHON_USEDEP}] )
	channels? ( ~dev-python/pychannels-1.0.0[${PYTHON_USEDEP}] )
	circuit? ( ~dev-python/circuit-webhook-1.0.1[${PYTHON_USEDEP}] )
	cisco_ios? ( ~dev-python/pexpect-4.6.0[${PYTHON_USEDEP}] )
	cisco_mobility_express? ( ~dev-python/ciscomobilityexpress-0.3.3[${PYTHON_USEDEP}] )
	cisco_webex_teams? ( ~dev-python/webexteamssdk-1.1.1[${PYTHON_USEDEP}] )
	clementine? ( ~dev-python/python-clementine-remote-1.0.1[${PYTHON_USEDEP}] )
	cli? ( app-misc/home-assistant-cli )
	cloud? ( ~dev-python/hass-nabucasa-0.37.0[${PYTHON_USEDEP}] )
	cloudflare? ( ~dev-python/pycfdns-0.0.1[${PYTHON_USEDEP}] )
	cmus? ( ~dev-python/pycmus-0.1.1[${PYTHON_USEDEP}] )
	co2signal? ( ~dev-python/CO2Signal-0.4.2[${PYTHON_USEDEP}] )
	coinbase? ( ~dev-python/coinbase-2.1.0[${PYTHON_USEDEP}] )
	coinmarketcap? ( ~dev-python/coinmarketcap-5.0.3[${PYTHON_USEDEP}] )
	comfoconnect? ( ~dev-python/pycomfoconnect-0.3[${PYTHON_USEDEP}] )
	concord232? ( ~dev-python/concord232-0.15[${PYTHON_USEDEP}] )
	control4? ( ~dev-python/pyControl4-0.0.6[${PYTHON_USEDEP}] )
	coolmaster? ( ~dev-python/pycoolmasternet-async-0.1.2[${PYTHON_USEDEP}] )
	coronavirus? ( ~dev-python/coronavirus-1.1.1[${PYTHON_USEDEP}] )
	cppm_tracker? ( ~dev-python/clearpasspy-1.0.2[${PYTHON_USEDEP}] )
	cpuspeed? ( ~dev-python/py-cpuinfo-7.0.0[${PYTHON_USEDEP}] )
	crimereports? ( ~dev-python/crimereports-1.0.1[${PYTHON_USEDEP}] )
	cups? ( ~dev-python/pycups-1.9.73[${PYTHON_USEDEP}] )
	daikin? ( ~dev-python/pydaikin-2.3.1[${PYTHON_USEDEP}] )
	danfoss_air? ( ~dev-python/pydanfossair-0.1.0[${PYTHON_USEDEP}] )
	darksky? ( ~dev-python/python-forecastio-1.4.0[${PYTHON_USEDEP}] )
	datadog? ( ~dev-python/datadog-0.15.0[${PYTHON_USEDEP}] )
	deconz? ( ~dev-python/pydeconz-73[${PYTHON_USEDEP}] )
	decora? ( ~dev-python/bluepy-1.3.0[${PYTHON_USEDEP}] ~dev-python/decora-0.6[${PYTHON_USEDEP}] )
	decora_wifi? ( ~dev-python/decora-wifi-1.4[${PYTHON_USEDEP}] )
	delijn? ( ~dev-python/pydelijn-0.6.1[${PYTHON_USEDEP}] )
	deluge? ( ~dev-python/deluge-client-1.7.1[${PYTHON_USEDEP}] )
	denonavr? ( ~dev-python/denonavr-0.9.4[${PYTHON_USEDEP}] ~dev-python/getmac-0.8.2[${PYTHON_USEDEP}] )
	deutsche_bahn? ( ~dev-python/schiene-0.23[${PYTHON_USEDEP}] )
	devolo_home_control? ( ~dev-python/devolo-home-control-api-0.13.0[${PYTHON_USEDEP}] )
	dexcom? ( ~dev-python/pydexcom-0.2.0[${PYTHON_USEDEP}] )
	dht? ( ~dev-python/Adafruit-DHT-1.4.0[${PYTHON_USEDEP}] )
	digitalloggers? ( ~dev-python/dlipower-0.7.165[${PYTHON_USEDEP}] )
	digital_ocean? ( ~dev-python/python-digitalocean-1.13.2[${PYTHON_USEDEP}] )
	directv? ( ~dev-python/directv-0.3.0[${PYTHON_USEDEP}] )
	discogs? ( ~dev-python/discogs-client-2.3.0[${PYTHON_USEDEP}] )
	discord? ( ~dev-python/discord-py-1.4.1[${PYTHON_USEDEP}] )
	discovery? ( ~dev-python/netdisco-2.8.2[${PYTHON_USEDEP}] )
	dlib_face_detect? ( ~dev-python/face_recognition-1.2.3[${PYTHON_USEDEP}] )
	dlib_face_identify? ( ~dev-python/face_recognition-1.2.3[${PYTHON_USEDEP}] )
	dlink? ( ~dev-python/pyW215-0.7.0[${PYTHON_USEDEP}] )
	dlna_dmr? ( ~dev-python/async-upnp-client-0.14.13[${PYTHON_USEDEP}] )
	dnsip? ( ~dev-python/aiodns-2.0.0[${PYTHON_USEDEP}] )
	dominos? ( ~dev-python/pizzapi-0.0.3[${PYTHON_USEDEP}] )
	doods? ( ~dev-python/pydoods-1.0.2[${PYTHON_USEDEP}] ~dev-python/pillow-7.2.0[${PYTHON_USEDEP}] )
	doorbird? ( ~dev-python/DoorBirdPy-2.1.0[${PYTHON_USEDEP}] )
	dovado? ( ~dev-python/dovado-0.4.1[${PYTHON_USEDEP}] )
	dsmr? ( ~dev-python/dsmr-parser-0.18[${PYTHON_USEDEP}] )
	dunehd? ( ~dev-python/pdunehd-1.3.2[${PYTHON_USEDEP}] )
	dwd_weather_warnings? ( ~dev-python/dwdwfsapi-1.0.2[${PYTHON_USEDEP}] )
	dweet? ( ~dev-python/dweepy-0.3.0[${PYTHON_USEDEP}] )
	dynalite? ( ~dev-python/dynalite-devices-0.1.46[${PYTHON_USEDEP}] )
	dyson? ( ~dev-python/libpurecool-0.6.3[${PYTHON_USEDEP}] )
	eafm? ( ~dev-python/aioeafm-0.1.2[${PYTHON_USEDEP}] )
	ebox? ( ~dev-python/pyebox-1.1.4[${PYTHON_USEDEP}] )
	ebusd? ( ~dev-python/ebusdpy-0.0.16[${PYTHON_USEDEP}] )
	ecoal_boiler? ( ~dev-python/ecoaliface-0.4.0[${PYTHON_USEDEP}] )
	ecobee? ( ~dev-python/python-ecobee-api-0.2.7[${PYTHON_USEDEP}] )
	econet? ( ~dev-python/pyeconet-0.0.11[${PYTHON_USEDEP}] )
	ecovacs? ( ~dev-python/sucks-0.9.4[${PYTHON_USEDEP}] )
	eddystone_temperature? ( ~dev-python/beacontools-1.2.3[${PYTHON_USEDEP}] ~dev-python/construct-2.9.45[${PYTHON_USEDEP}] )
	edimax? ( ~dev-python/pyedimax-0.2.1[${PYTHON_USEDEP}] )
	edl21? ( ~dev-python/pysml-0.0.2[${PYTHON_USEDEP}] )
	ee_brightbox? ( ~dev-python/eebrightbox-0.0.4[${PYTHON_USEDEP}] )
	egardia? ( ~dev-python/pythonegardia-1.0.40[${PYTHON_USEDEP}] )
	eight_sleep? ( ~dev-python/pyEight-0.1.4[${PYTHON_USEDEP}] )
	elgato? ( ~dev-python/elgato-0.2.0[${PYTHON_USEDEP}] )
	eliqonline? ( ~dev-python/eliqonline-1.2.2[${PYTHON_USEDEP}] )
	elkm1? ( ~dev-python/elkm1-lib-0.7.19[${PYTHON_USEDEP}] )
	elv? ( ~dev-python/pypca-0.0.7[${PYTHON_USEDEP}] )
	emby? ( ~dev-python/pyEmby-1.6[${PYTHON_USEDEP}] )
	emulated_hue? ( ~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}] )
	emulated_kasa? ( ~dev-python/sense-energy-0.8.0[${PYTHON_USEDEP}] )
	emulated_roku? ( ~dev-python/emulated-roku-0.2.1[${PYTHON_USEDEP}] )
	enigma2? ( ~dev-python/openwebifpy-3.1.1[${PYTHON_USEDEP}] )
	enocean? ( ~dev-python/enocean-0.50.1[${PYTHON_USEDEP}] )
	enphase_envoy? ( ~dev-python/envoy-reader-0.16.1[${PYTHON_USEDEP}] )
	entur_public_transport? ( ~dev-python/enturclient-0.2.1[${PYTHON_USEDEP}] )
	environment_canada? ( ~dev-python/env-canada-0.2.0[${PYTHON_USEDEP}] )
	envirophat? ( ~dev-python/envirophat-0.0.6[${PYTHON_USEDEP}] ~dev-python/smbus-cffi-0.5.1[${PYTHON_USEDEP}] )
	envisalink? ( ~dev-python/pyenvisalink-4.0[${PYTHON_USEDEP}] )
	ephember? ( ~dev-python/pyephember-0.3.1[${PYTHON_USEDEP}] )
	epson? ( ~dev-python/epson-projector-0.1.3[${PYTHON_USEDEP}] )
	epsonworkforce? ( ~dev-python/epsonprinter-0.0.9[${PYTHON_USEDEP}] )
	eq3btsmart? ( ~dev-python/construct-2.9.45[${PYTHON_USEDEP}] ~dev-python/python-eq3bt-0.1.11[${PYTHON_USEDEP}] )
	esphome? ( ~dev-python/aioesphomeapi-2.6.3[${PYTHON_USEDEP}] )
	essent? ( ~dev-python/PyEssent-0.13[${PYTHON_USEDEP}] )
	etherscan? ( ~dev-python/python-etherscan-api-0.0.3[${PYTHON_USEDEP}] )
	eufy? ( ~dev-python/lakeside-0.12[${PYTHON_USEDEP}] )
	everlights? ( ~dev-python/pyeverlights-0.1.0[${PYTHON_USEDEP}] )
	evohome? ( ~dev-python/evohome-async-0.3.5[${PYTHON_USEDEP}] )
	ezviz? ( ~dev-python/pyEzviz-0.1.5.2[${PYTHON_USEDEP}] )
	familyhub? ( ~dev-python/python-family-hub-local-0.0.2[${PYTHON_USEDEP}] )
	fastdotcom? ( ~dev-python/fastdotcom-0.0.3[${PYTHON_USEDEP}] )
	feedreader? ( ~dev-python/feedparser-homeassistant-5.2.2[${PYTHON_USEDEP}] )
	ffmpeg? ( ~dev-python/ha-ffmpeg-2.0[${PYTHON_USEDEP}] )
	fibaro? ( ~dev-python/fiblary3-0.1.7[${PYTHON_USEDEP}] )
	fido? ( ~dev-python/pyfido-2.1.1[${PYTHON_USEDEP}] )
	fints? ( ~dev-python/fints-1.0.1[${PYTHON_USEDEP}] )
	firmata? ( ~dev-python/pymata-express-1.13[${PYTHON_USEDEP}] )
	fitbit? ( ~dev-python/fitbit-0.3.1[${PYTHON_USEDEP}] )
	fixer? ( ~dev-python/fixerio-1.0.0_alpha0[${PYTHON_USEDEP}] )
	fleetgo? ( ~dev-python/ritassist-0.9.2[${PYTHON_USEDEP}] )
	flexit? ( ~dev-python/pyflexit-0.3[${PYTHON_USEDEP}] )
	flic? ( ~dev-python/pyflic-homeassistant-0.4[${PYTHON_USEDEP}] )
	flick_electric? ( ~dev-python/PyFlick-0.0.2[${PYTHON_USEDEP}] )
	flo? ( ~dev-python/aioflo-0.4.1[${PYTHON_USEDEP}] )
	flume? ( ~dev-python/PyFlume-0.5.5[${PYTHON_USEDEP}] )
	flunearyou? ( ~dev-python/pyflunearyou-1.0.7[${PYTHON_USEDEP}] )
	flux_led? ( ~dev-python/flux-led-0.22[${PYTHON_USEDEP}] )
	folder_watcher? ( ~dev-python/watchdog-0.8.3[${PYTHON_USEDEP}] )
	foobot? ( ~dev-python/foobot_async-0.3.2[${PYTHON_USEDEP}] )
	forked_daapd? ( ~dev-python/pyforked-daapd-0.1.10[${PYTHON_USEDEP}] ~dev-python/pylibrespot-java-0.1.0[${PYTHON_USEDEP}] )
	fortios? ( ~dev-python/fortiosapi-0.10.8[${PYTHON_USEDEP}] )
	foscam? ( ~dev-python/libpyfoscam-1.0[${PYTHON_USEDEP}] )
	freebox? ( ~dev-python/aiofreepybox-0.0.8[${PYTHON_USEDEP}] )
	free_mobile? ( ~dev-python/freesms-0.1.2[${PYTHON_USEDEP}] )
	fritz? ( ~dev-python/fritzconnection-1.2.0[${PYTHON_USEDEP}] )
	fritzbox? ( ~dev-python/pyfritzhome-0.4.2[${PYTHON_USEDEP}] )
	fritzbox_callmonitor? ( ~dev-python/fritzconnection-1.2.0[${PYTHON_USEDEP}] )
	fritzbox_netmonitor? ( ~dev-python/fritzconnection-1.2.0[${PYTHON_USEDEP}] )
	fronius? ( ~dev-python/PyFronius-0.4.6[${PYTHON_USEDEP}] )
	frontend? ( ~dev-python/home-assistant-frontend-20200918.2[${PYTHON_USEDEP}] )
	frontier_silicon? ( ~dev-python/afsapi-0.0.4[${PYTHON_USEDEP}] )
	futurenow? ( ~dev-python/pyfnip-0.2[${PYTHON_USEDEP}] )
	garmin_connect? ( ~dev-python/garminconnect-0.1.13[${PYTHON_USEDEP}] )
	gc100? ( ~dev-python/python-gc100-1.0.3_alpha0[${PYTHON_USEDEP}] )
	gdacs? ( ~dev-python/aio-georss-gdacs-0.3[${PYTHON_USEDEP}] )
	geizhals? ( ~dev-python/geizhals-0.0.9[${PYTHON_USEDEP}] )
	geniushub? ( ~dev-python/geniushub-client-0.6.30[${PYTHON_USEDEP}] )
	geonetnz_quakes? ( ~dev-python/aio-geojson-geonetnz-quakes-0.12[${PYTHON_USEDEP}] )
	geonetnz_volcano? ( ~dev-python/aio-geojson-geonetnz-volcano-0.5[${PYTHON_USEDEP}] )
	geo_json_events? ( ~dev-python/geojson-client-0.4[${PYTHON_USEDEP}] )
	geo_rss_events? ( ~dev-python/georss-generic-client-0.3[${PYTHON_USEDEP}] )
	gios? ( ~dev-python/gios-0.1.4[${PYTHON_USEDEP}] )
	github? ( ~dev-python/PyGithub-1.43.8[${PYTHON_USEDEP}] )
	gitlab_ci? ( ~dev-python/python-gitlab-1.6.0[${PYTHON_USEDEP}] )
	gitter? ( ~dev-python/gitterpy-0.1.7[${PYTHON_USEDEP}] )
	glances? ( ~dev-python/glances_api-0.2.0[${PYTHON_USEDEP}] )
	gntp? ( ~dev-python/gntp-1.0.3[${PYTHON_USEDEP}] )
	goalfeed? ( ~dev-python/Pysher-1.0.1[${PYTHON_USEDEP}] )
	gogogate2? ( ~dev-python/gogogate2-api-2.0.3[${PYTHON_USEDEP}] )
	google? ( ~dev-python/google-api-python-client-1.6.4[${PYTHON_USEDEP}] ~dev-python/httplib2-0.10.3[${PYTHON_USEDEP}] ~dev-python/oauth2client-4.0.0[${PYTHON_USEDEP}] )
	google_maps? ( ~dev-python/locationsharinglib-4.1.0[${PYTHON_USEDEP}] )
	google_translate? ( ~dev-python/gTTS-token-1.1.3[${PYTHON_USEDEP}] )
	google_travel_time? ( ~dev-python/googlemaps-2.5.1[${PYTHON_USEDEP}] )
	gpmdp? ( ~dev-python/websocket-client-0.54.0[${PYTHON_USEDEP}] )
	gpsd? ( ~dev-python/gps3-0.33.3[${PYTHON_USEDEP}] )
	greeneye_monitor? ( ~dev-python/greeneye-monitor-2.0[${PYTHON_USEDEP}] )
	greenwave? ( ~dev-python/greenwavereality-0.5.1[${PYTHON_USEDEP}] )
	griddy? ( ~dev-python/griddypower-0.1.0[${PYTHON_USEDEP}] )
	growatt_server? ( ~dev-python/growattServer-0.1.1[${PYTHON_USEDEP}] )
	gstreamer? ( ~dev-python/gstreamer-player-1.1.2[${PYTHON_USEDEP}] )
	gtfs? ( ~dev-python/pygtfs-0.1.5[${PYTHON_USEDEP}] )
	guardian? ( ~dev-python/aioguardian-1.0.1[${PYTHON_USEDEP}] )
	habitica? ( ~dev-python/habitipy-0.2.0[${PYTHON_USEDEP}] )
	hangouts? ( ~dev-python/hangups-0.4.11[${PYTHON_USEDEP}] )
	harman_kardon_avr? ( ~dev-python/hkavr-0.0.5[${PYTHON_USEDEP}] )
	harmony? ( ~dev-python/aioharmony-0.2.6[${PYTHON_USEDEP}] )
	hdmi_cec? ( ~dev-python/pyCEC-0.4.13[${PYTHON_USEDEP}] )
	heatmiser? ( ~dev-python/heatmiserV3-1.1.18[${PYTHON_USEDEP}] )
	heos? ( ~dev-python/pyheos-0.6.0[${PYTHON_USEDEP}] )
	here_travel_time? ( ~dev-python/herepy-2.0.0[${PYTHON_USEDEP}] )
	hikvision? ( ~dev-python/pyHik-0.2.7[${PYTHON_USEDEP}] )
	hikvisioncam? ( ~dev-python/hikvision-0.4[${PYTHON_USEDEP}] )
	hisense_aehw4a1? ( ~dev-python/pyaehw4a1-0.3.9[${PYTHON_USEDEP}] )
	hive? ( ~dev-python/pyhiveapi-0.2.20.1[${PYTHON_USEDEP}] )
	hlk_sw16? ( ~dev-python/hlk-sw16-0.0.9[${PYTHON_USEDEP}] )
	homekit? ( ~dev-python/HAP-python-3.0.0[${PYTHON_USEDEP}] ~dev-python/fnvhash-0.1.0[${PYTHON_USEDEP}] ~dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}] ~dev-python/base36-0.1.1[${PYTHON_USEDEP}] ~dev-python/PyTurboJPEG-1.4.0[${PYTHON_USEDEP}] )
	homekit_controller? ( ~dev-python/aiohomekit-0.2.53[${PYTHON_USEDEP}] )
	homematic? ( ~dev-python/pyhomematic-0.1.68[${PYTHON_USEDEP}] )
	homematicip_cloud? ( ~dev-python/homematicip-0.11.0[${PYTHON_USEDEP}] )
	homeworks? ( ~dev-python/pyhomeworks-0.0.6[${PYTHON_USEDEP}] )
	home_connect? ( ~dev-python/homeconnect-0.5[${PYTHON_USEDEP}] )
	honeywell? ( ~dev-python/somecomfort-0.5.2[${PYTHON_USEDEP}] )
	horizon? ( ~dev-python/horimote-0.4.1[${PYTHON_USEDEP}] )
	hp_ilo? ( ~dev-python/python-hpilo-4.3[${PYTHON_USEDEP}] )
	html5? ( ~dev-python/pywebpush-1.9.2[${PYTHON_USEDEP}] )
	http? ( ~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}] )
	htu21d? ( ~dev-python/i2csense-0.0.4[${PYTHON_USEDEP}] ~dev-python/smbus-cffi-0.5.1[${PYTHON_USEDEP}] )
	huawei_lte? ( ~dev-python/getmac-0.8.2[${PYTHON_USEDEP}] ~dev-python/huawei-lte-api-1.4.12[${PYTHON_USEDEP}] ~dev-python/stringcase-1.2.0[${PYTHON_USEDEP}] ~dev-python/url-normalize-1.4.1[${PYTHON_USEDEP}] )
	hue? ( ~dev-python/aiohue-2.1.0[${PYTHON_USEDEP}] )
	hunterdouglas_powerview? ( ~dev-python/aiopvapi-1.6.14[${PYTHON_USEDEP}] )
	hvv_departures? ( ~dev-python/pygti-0.6.0[${PYTHON_USEDEP}] )
	hydrawise? ( ~dev-python/Hydrawiser-0.2[${PYTHON_USEDEP}] )
	ialarm? ( ~dev-python/pyialarm-0.3[${PYTHON_USEDEP}] )
	iammeter? ( ~dev-python/iammeter-0.1.7[${PYTHON_USEDEP}] )
	iaqualink? ( ~dev-python/iaqualink-0.3.4[${PYTHON_USEDEP}] )
	icloud? ( ~dev-python/pyicloud-0.9.7[${PYTHON_USEDEP}] )
	idteck_prox? ( ~dev-python/rfk101py-0.0.1[${PYTHON_USEDEP}] )
	ifttt? ( ~dev-python/pyfttt-0.3.2[${PYTHON_USEDEP}] )
	iglo? ( ~dev-python/iglo-1.2.7[${PYTHON_USEDEP}] )
	ign_sismologia? ( ~dev-python/georss-ign-sismologia-client-0.2[${PYTHON_USEDEP}] )
	ihc? ( ~dev-python/defusedxml-0.6.0[${PYTHON_USEDEP}] ~dev-python/ihcsdk-2.7.0[${PYTHON_USEDEP}] )
	image? ( ~dev-python/pillow-7.2.0[${PYTHON_USEDEP}] )
	imap? ( ~dev-python/aioimaplib-0.7.15[${PYTHON_USEDEP}] )
	incomfort? ( ~dev-python/incomfort-client-0.4.0[${PYTHON_USEDEP}] )
	influxdb? ( ~dev-python/influxdb-5.2.3[${PYTHON_USEDEP}] ~dev-python/influxdb-client-1.8.0[${PYTHON_USEDEP}] )
	insteon? ( ~dev-python/pyinsteon-1.0.8[${PYTHON_USEDEP}] )
	intesishome? ( ~dev-python/pyintesishome-1.7.5[${PYTHON_USEDEP}] )
	iota? ( ~dev-python/PyOTA-2.0.5[${PYTHON_USEDEP}] )
	iperf3? ( ~dev-python/iperf3-0.1.11[${PYTHON_USEDEP}] )
	ipma? ( ~dev-python/pyipma-2.0.5[${PYTHON_USEDEP}] )
	ipp? ( ~dev-python/pyipp-0.11.0[${PYTHON_USEDEP}] )
	iqvia? ( ~dev-python/numpy-1.19.1[${PYTHON_USEDEP}] ~dev-python/pyiqvia-0.2.1[${PYTHON_USEDEP}] )
	irish_rail_transport? ( ~dev-python/pyirishrail-0.0.2[${PYTHON_USEDEP}] )
	islamic_prayer_times? ( ~dev-python/prayer_times_calculator-0.0.3[${PYTHON_USEDEP}] )
	iss? ( ~dev-python/pyiss-1.0.1[${PYTHON_USEDEP}] )
	isy994? ( ~dev-python/pyisy-2.0.2[${PYTHON_USEDEP}] )
	itach? ( ~dev-python/pyitachip2ir-0.0.7[${PYTHON_USEDEP}] )
	izone? ( ~dev-python/python-izone-1.1.2[${PYTHON_USEDEP}] )
	jewish_calendar? ( ~dev-python/hdate-0.9.5[${PYTHON_USEDEP}] )
	joaoapps_join? ( ~dev-python/python-join-api-0.0.6[${PYTHON_USEDEP}] )
	juicenet? ( ~dev-python/python-juicenet-1.0.1[${PYTHON_USEDEP}] )
	kaiterra? ( ~dev-python/kaiterra-async-client-0.0.2[${PYTHON_USEDEP}] )
	keba? ( ~dev-python/keba-kecontact-1.1.0[${PYTHON_USEDEP}] )
	keenetic_ndms2? ( ~dev-python/ndms2-client-0.0.11[${PYTHON_USEDEP}] )
	kef? ( ~dev-python/aiokef-0.2.13[${PYTHON_USEDEP}] ~dev-python/getmac-0.8.2[${PYTHON_USEDEP}] )
	keyboard? ( ~dev-python/PyUserInput-0.1.11[${PYTHON_USEDEP}] )
	keyboard_remote? ( ~dev-python/evdev-1.1.2[${PYTHON_USEDEP}] ~dev-python/aionotify-0.2.0[${PYTHON_USEDEP}] )
	kira? ( ~dev-python/pykira-0.1.1[${PYTHON_USEDEP}] )
	kiwi? ( ~dev-python/kiwiki-client-0.1.1[${PYTHON_USEDEP}] )
	knx? ( ~dev-python/xknx-0.13.0[${PYTHON_USEDEP}] )
	kodi? ( ~dev-python/pykodi-0.2.0[${PYTHON_USEDEP}] )
	konnected? ( ~dev-python/konnected-1.2.0[${PYTHON_USEDEP}] )
	kwb? ( ~dev-python/pykwb-0.0.8[${PYTHON_USEDEP}] )
	lametric? ( ~dev-python/lmnotify-0.0.4[${PYTHON_USEDEP}] )
	lastfm? ( ~dev-python/pylast-3.3.0[${PYTHON_USEDEP}] )
	launch_library? ( ~dev-python/pylaunches-0.2.0[${PYTHON_USEDEP}] )
	lcn? ( ~dev-python/pypck-0.6.4[${PYTHON_USEDEP}] )
	lg_netcast? ( ~dev-python/pylgnetcast-homeassistant-0.2.0[${PYTHON_USEDEP}] )
	lg_soundbar? ( ~dev-python/temescal-0.3[${PYTHON_USEDEP}] )
	life360? ( ~dev-python/life360-4.1.1[${PYTHON_USEDEP}] )
	lifx? ( ~dev-python/aiolifx-0.6.7[${PYTHON_USEDEP}] ~dev-python/aiolifx-effects-0.2.2[${PYTHON_USEDEP}] )
	lifx_legacy? ( ~dev-python/liffylights-0.9.4[${PYTHON_USEDEP}] )
	lightwave? ( ~dev-python/lightwave-0.18[${PYTHON_USEDEP}] )
	limitlessled? ( ~dev-python/limitlessled-1.1.3[${PYTHON_USEDEP}] )
	linode? ( ~dev-python/linode-api-4.1.9_beta1[${PYTHON_USEDEP}] )
	linux_battery? ( ~dev-python/batinfo-0.4.2[${PYTHON_USEDEP}] )
	lirc? ( ~dev-python/python-lirc-1.2.3[${PYTHON_USEDEP}] )
	litejet? ( ~dev-python/pylitejet-0.1.0[${PYTHON_USEDEP}] )
	logi_circle? ( ~dev-python/logi-circle-0.2.2[${PYTHON_USEDEP}] )
	london_underground? ( ~dev-python/london-tube-status-0.2[${PYTHON_USEDEP}] )
	loopenergy? ( ~dev-python/pyloopenergy-0.2.1[${PYTHON_USEDEP}] )
	luci? ( ~dev-python/openwrt-luci-rpc-1.1.6[${PYTHON_USEDEP}] )
	luftdaten? ( ~dev-python/luftdaten-0.6.4[${PYTHON_USEDEP}] )
	lupusec? ( ~dev-python/lupupy-0.0.18[${PYTHON_USEDEP}] )
	lutron? ( ~dev-python/pylutron-0.2.5[${PYTHON_USEDEP}] )
	lutron_caseta? ( ~dev-python/pylutron-caseta-0.6.1[${PYTHON_USEDEP}] )
	lw12wifi? ( ~dev-python/lw12-0.9.2[${PYTHON_USEDEP}] )
	lyft? ( ~dev-python/lyft_rides-0.2[${PYTHON_USEDEP}] )
	magicseaweed? ( ~dev-python/magicseaweed-1.0.3[${PYTHON_USEDEP}] )
	mailgun? ( ~dev-python/pymailgunner-1.4[${PYTHON_USEDEP}] )
	marytts? ( ~dev-python/speak2mary-1.4.0[${PYTHON_USEDEP}] )
	mastodon? ( ~dev-python/Mastodon-py-1.5.1[${PYTHON_USEDEP}] )
	matrix? ( ~dev-python/matrix-client-0.3.2[${PYTHON_USEDEP}] )
	maxcube? ( ~dev-python/maxcube-api-0.1.0[${PYTHON_USEDEP}] )
	mcp23017? ( ~dev-python/RPi-GPIO-0.7.0[${PYTHON_USEDEP}] ~dev-python/Adafruit-Blinka-3.9.0[${PYTHON_USEDEP}] ~dev-python/adafruit-circuitpython-mcp230xx-2.2.2[${PYTHON_USEDEP}] )
	mediaroom? ( ~dev-python/pymediaroom-0.6.4.1[${PYTHON_USEDEP}] )
	media_extractor? ( ~dev-python/youtube_dl-2020.7.28[${PYTHON_USEDEP}] )
	melcloud? ( ~dev-python/pymelcloud-2.5.2[${PYTHON_USEDEP}] )
	melissa? ( ~dev-python/py-melissa-climate-2.1.4[${PYTHON_USEDEP}] )
	message_bird? ( ~dev-python/messagebird-1.2.0[${PYTHON_USEDEP}] )
	met? ( ~dev-python/PyMetno-0.8.1[${PYTHON_USEDEP}] )
	meteoalarm? ( ~dev-python/meteoalertapi-0.1.6[${PYTHON_USEDEP}] )
	meteo_france? ( ~dev-python/meteofrance-api-0.1.1[${PYTHON_USEDEP}] )
	metoffice? ( ~dev-python/datapoint-0.9.5[${PYTHON_USEDEP}] )
	mfi? ( ~dev-python/mficlient-0.3.0[${PYTHON_USEDEP}] )
	mhz19? ( ~dev-python/pmsensor-0.4[${PYTHON_USEDEP}] )
	microsoft? ( ~dev-python/pycsspeechtts-1.0.3[${PYTHON_USEDEP}] )
	miflora? ( ~dev-python/bluepy-1.3.0[${PYTHON_USEDEP}] ~dev-python/miflora-0.7.0[${PYTHON_USEDEP}] )
	mikrotik? ( ~dev-python/librouteros-3.0.0[${PYTHON_USEDEP}] )
	mill? ( ~dev-python/millheater-0.3.4[${PYTHON_USEDEP}] )
	minecraft_server? ( ~dev-python/aiodns-2.0.0[${PYTHON_USEDEP}] ~dev-python/getmac-0.8.2[${PYTHON_USEDEP}] ~dev-python/mcstatus-2.3.0[${PYTHON_USEDEP}] )
	minio? ( ~dev-python/minio-4.0.9[${PYTHON_USEDEP}] )
	mitemp_bt? ( ~dev-python/mitemp-bt-0.0.3[${PYTHON_USEDEP}] )
	mobile_app? ( ~dev-python/pynacl-1.3.0[${PYTHON_USEDEP}] ~dev-python/emoji-0.5.4[${PYTHON_USEDEP}] )
	mochad? ( ~dev-python/pymochad-0.2.0[${PYTHON_USEDEP}] )
	modbus? ( ~dev-python/pymodbus-2.3.0[${PYTHON_USEDEP}] )
	modem_callerid? ( ~dev-python/basicmodem-0.7[${PYTHON_USEDEP}] )
	monoprice? ( ~dev-python/pymonoprice-0.3[${PYTHON_USEDEP}] )
	mpd? ( ~dev-python/python-mpd2-1.0.0[${PYTHON_USEDEP}] )
	mqtt? ( ~dev-python/paho-mqtt-1.5.0[${PYTHON_USEDEP}] )
	msteams? ( ~dev-python/pymsteams-0.1.12[${PYTHON_USEDEP}] )
	mvglive? ( ~dev-python/PyMVGLive-1.1.4[${PYTHON_USEDEP}] )
	mychevy? ( ~dev-python/mychevy-2.0.1[${PYTHON_USEDEP}] )
	mycroft? ( ~dev-python/mycroftapi-2.0[${PYTHON_USEDEP}] )
	myq? ( ~dev-python/pymyq-2.0.5[${PYTHON_USEDEP}] )
	mysensors? ( ~dev-python/pymysensors-0.18.0[${PYTHON_USEDEP}] )
	mysql? ( dev-python/mysql-connector-python[${PYTHON_USEDEP}] dev-python/mysqlclient[${PYTHON_USEDEP}] )
	mystrom? ( ~dev-python/python-mystrom-1.1.2[${PYTHON_USEDEP}] )
	mythicbeastsdns? ( ~dev-python/mbddns-0.1.2[${PYTHON_USEDEP}] )
	n26? ( ~dev-python/n26-0.2.7[${PYTHON_USEDEP}] )
	nad? ( ~dev-python/nad-receiver-0.0.12[${PYTHON_USEDEP}] )
	namecheapdns? ( ~dev-python/defusedxml-0.6.0[${PYTHON_USEDEP}] )
	nanoleaf? ( ~dev-python/pynanoleaf-0.0.5[${PYTHON_USEDEP}] )
	neato? ( ~dev-python/pybotvac-0.0.17[${PYTHON_USEDEP}] )
	nederlandse_spoorwegen? ( ~dev-python/nsapi-3.0.4[${PYTHON_USEDEP}] )
	nello? ( ~dev-python/pynello-2.0.2[${PYTHON_USEDEP}] )
	ness_alarm? ( ~dev-python/nessclient-0.9.15[${PYTHON_USEDEP}] )
	nest? ( ~dev-python/python-nest-4.1.0[${PYTHON_USEDEP}] )
	netatmo? ( ~dev-python/pyatmo-4.0.0[${PYTHON_USEDEP}] )
	netdata? ( ~dev-python/netdata-0.2.0[${PYTHON_USEDEP}] )
	netgear? ( ~dev-python/pynetgear-0.6.1[${PYTHON_USEDEP}] )
	netgear_lte? ( ~dev-python/eternalegypt-0.0.12[${PYTHON_USEDEP}] )
	netio? ( ~dev-python/pynetio-0.1.9.1[${PYTHON_USEDEP}] )
	neurio_energy? ( ~dev-python/neurio-0.3.1[${PYTHON_USEDEP}] )
	nexia? ( ~dev-python/nexia-0.9.4[${PYTHON_USEDEP}] )
	nextbus? ( ~dev-python/py-nextbusnext-0.1.4[${PYTHON_USEDEP}] )
	nextcloud? ( ~dev-python/nextcloudmonitor-1.1.0[${PYTHON_USEDEP}] )
	nightscout? ( ~dev-python/py-nightscout-1.2.1[${PYTHON_USEDEP}] )
	niko_home_control? ( ~dev-python/niko-home-control-0.2.1[${PYTHON_USEDEP}] )
	nilu? ( ~dev-python/niluclient-0.1.2[${PYTHON_USEDEP}] )
	nissan_leaf? ( ~dev-python/pycarwings2-2.9[${PYTHON_USEDEP}] )
	nmap_tracker? ( ~dev-python/python-nmap-0.6.1[${PYTHON_USEDEP}] ~dev-python/getmac-0.8.2[${PYTHON_USEDEP}] )
	nmbs? ( ~dev-python/pyrail-0.0.3[${PYTHON_USEDEP}] )
	noaa_tides? ( ~dev-python/noaa-coops-0.1.8[${PYTHON_USEDEP}] )
	norway_air? ( ~dev-python/PyMetno-0.8.1[${PYTHON_USEDEP}] )
	notify_events? ( ~dev-python/notify-events-1.0.4[${PYTHON_USEDEP}] )
	notion? ( ~dev-python/aionotion-1.1.0[${PYTHON_USEDEP}] )
	nsw_fuel_station? ( ~dev-python/nsw-fuel-api-client-1.0.10[${PYTHON_USEDEP}] )
	nsw_rural_fire_service_feed? ( ~dev-python/aio-geojson-nsw-rfs-incidents-0.3[${PYTHON_USEDEP}] )
	nuheat? ( ~dev-python/nuheat-0.3.0[${PYTHON_USEDEP}] )
	nuimo_controller? ( ~dev-python/nuimo-0.1.0[${PYTHON_USEDEP}] )
	nuki? ( ~dev-python/pynuki-1.3.8[${PYTHON_USEDEP}] )
	numato? ( ~dev-python/numato-gpio-0.8.0[${PYTHON_USEDEP}] )
	nut? ( ~dev-python/pynut2-2.1.2[${PYTHON_USEDEP}] )
	nws? ( ~dev-python/pynws-1.2.1[${PYTHON_USEDEP}] )
	nx584? ( ~dev-python/pynx584-0.5[${PYTHON_USEDEP}] )
	nzbget? ( ~dev-python/pynzbgetapi-0.2.0[${PYTHON_USEDEP}] )
	oasa_telematics? ( ~dev-python/oasatelematics-0.3[${PYTHON_USEDEP}] )
	obihai? ( ~dev-python/pyobihai-1.2.3[${PYTHON_USEDEP}] )
	oem? ( ~dev-python/oemthermostat-1.1[${PYTHON_USEDEP}] )
	ohmconnect? ( ~dev-python/defusedxml-0.6.0[${PYTHON_USEDEP}] )
	ombi? ( ~dev-python/pyombi-0.1.10[${PYTHON_USEDEP}] )
	onewire? ( ~dev-python/pyownet-0.10.0[${PYTHON_USEDEP}] )
	onkyo? ( ~dev-python/onkyo-eiscp-1.2.7[${PYTHON_USEDEP}] )
	onvif? ( ~dev-python/onvif-zeep-async-0.5.0[${PYTHON_USEDEP}] ~dev-python/WSDiscovery-2.0.0[${PYTHON_USEDEP}] )
	opencv? ( ~dev-python/numpy-1.19.1[${PYTHON_USEDEP}] )
	openerz? ( ~dev-python/openerz-api-0.1.0[${PYTHON_USEDEP}] )
	openevse? ( ~dev-python/openevsewifi-1.1.0[${PYTHON_USEDEP}] )
	opengarage? ( ~dev-python/open-garage-0.1.4[${PYTHON_USEDEP}] )
	openhome? ( ~dev-python/openhomedevice-0.7.2[${PYTHON_USEDEP}] )
	opensensemap? ( ~dev-python/opensensemap-api-0.1.5[${PYTHON_USEDEP}] )
	opentherm_gw? ( ~dev-python/pyotgw-0.6_beta1[${PYTHON_USEDEP}] )
	openuv? ( ~dev-python/pyopenuv-1.0.9[${PYTHON_USEDEP}] )
	openweathermap? ( ~dev-python/pyowm-2.10.0[${PYTHON_USEDEP}] )
	opnsense? ( ~dev-python/pyopnsense-0.2.0[${PYTHON_USEDEP}] )
	opple? ( ~dev-python/pyoppleio-1.0.5[${PYTHON_USEDEP}] )
	orangepi_gpio? ( ~dev-python/OPi-GPIO-0.4.0[${PYTHON_USEDEP}] )
	oru? ( ~dev-python/oru-0.1.11[${PYTHON_USEDEP}] )
	orvibo? ( ~dev-python/orvibo-1.1.1[${PYTHON_USEDEP}] )
	osramlightify? ( ~dev-python/lightify-1.0.7.2[${PYTHON_USEDEP}] )
	otp? ( ~dev-python/pyotp-2.3.0[${PYTHON_USEDEP}] )
	ovo_energy? ( ~dev-python/ovoenergy-1.1.7[${PYTHON_USEDEP}] )
	owntracks? ( ~dev-python/pynacl-1.3.0[${PYTHON_USEDEP}] )
	ozw? ( ~dev-python/python-openzwave-mqtt-1.0.5[${PYTHON_USEDEP}] )
	panasonic_bluray? ( ~dev-python/panacotta-0.1[${PYTHON_USEDEP}] )
	panasonic_viera? ( ~dev-python/panasonic-viera-0.3.6[${PYTHON_USEDEP}] )
	pandora? ( ~dev-python/pexpect-4.6.0[${PYTHON_USEDEP}] )
	pcal9535a? ( ~dev-python/pcal9535a-0.7[${PYTHON_USEDEP}] )
	pencom? ( ~dev-python/pencompy-0.0.3[${PYTHON_USEDEP}] )
	philips_js? ( ~dev-python/ha-philipsjs-0.0.8[${PYTHON_USEDEP}] )
	pi4ioe5v9xxxx? ( ~dev-python/pi4ioe5v9xxxx-0.0.2[${PYTHON_USEDEP}] )
	piglow? ( ~dev-python/piglow-1.2.4[${PYTHON_USEDEP}] )
	pilight? ( ~dev-python/pilight-0.1.1[${PYTHON_USEDEP}] )
	ping? ( ~dev-python/icmplib-1.1.3[${PYTHON_USEDEP}] )
	pi_hole? ( ~dev-python/hole-0.5.1[${PYTHON_USEDEP}] )
	pjlink? ( ~dev-python/pypjlink2-1.2.1[${PYTHON_USEDEP}] )
	plex? ( ~dev-python/PlexAPI-4.1.0[${PYTHON_USEDEP}] ~dev-python/plexauth-0.0.5[${PYTHON_USEDEP}] ~dev-python/plexwebsocket-0.0.11[${PYTHON_USEDEP}] )
	plugwise? ( ~dev-python/Plugwise-Smile-1.4.0[${PYTHON_USEDEP}] )
	plum_lightpad? ( ~dev-python/plumlightpad-0.0.11[${PYTHON_USEDEP}] )
	pocketcasts? ( ~dev-python/pocketcasts-0.1[${PYTHON_USEDEP}] )
	point? ( ~dev-python/pypoint-1.1.2[${PYTHON_USEDEP}] )
	poolsense? ( ~dev-python/poolsense-0.0.8[${PYTHON_USEDEP}] )
	powerwall? ( ~dev-python/tesla-powerwall-0.2.12[${PYTHON_USEDEP}] )
	progettihwsw? ( ~dev-python/ProgettiHWSW-0.1.1[${PYTHON_USEDEP}] )
	proliphix? ( ~dev-python/proliphix-0.4.1[${PYTHON_USEDEP}] )
	prometheus? ( ~dev-python/prometheus_client-0.7.1[${PYTHON_USEDEP}] )
	proxmoxve? ( ~dev-python/proxmoxer-1.1.1[${PYTHON_USEDEP}] )
	proxy? ( ~dev-python/pillow-7.2.0[${PYTHON_USEDEP}] )
	ps4? ( ~dev-python/pyps4-2ndscreen-1.1.1[${PYTHON_USEDEP}] )
	ptvsd? ( ~dev-python/ptvsd-4.3.2[${PYTHON_USEDEP}] )
	pulseaudio_loopback? ( ~dev-python/pulsectl-20.2.4[${PYTHON_USEDEP}] )
	pushbullet? ( ~dev-python/pushbullet-py-0.11.0[${PYTHON_USEDEP}] )
	pushover? ( ~dev-python/pushover_complete-1.1.1[${PYTHON_USEDEP}] )
	pvpc_hourly_pricing? ( ~dev-python/aiopvpc-2.0.2[${PYTHON_USEDEP}] )
	python_script? ( ~dev-python/RestrictedPython-5.0[${PYTHON_USEDEP}] )
	qbittorrent? ( ~dev-python/python-qbittorrent-0.4.1[${PYTHON_USEDEP}] )
	qld_bushfire? ( ~dev-python/georss-qld-bushfire-alert-client-0.3[${PYTHON_USEDEP}] )
	qnap? ( ~dev-python/qnapstats-0.3.0[${PYTHON_USEDEP}] )
	qrcode? ( ~dev-python/pillow-7.2.0[${PYTHON_USEDEP}] ~dev-python/pyzbar-0.1.7[${PYTHON_USEDEP}] )
	quantum_gateway? ( ~dev-python/quantum-gateway-0.0.5[${PYTHON_USEDEP}] )
	qvr_pro? ( ~dev-python/pyqvrpro-0.52[${PYTHON_USEDEP}] )
	qwikswitch? ( ~dev-python/pyqwikswitch-0.93[${PYTHON_USEDEP}] )
	rachio? ( ~dev-python/RachioPy-0.1.4[${PYTHON_USEDEP}] )
	radiotherm? ( ~dev-python/radiotherm-2.0.0[${PYTHON_USEDEP}] )
	rainbird? ( ~dev-python/pyrainbird-0.4.2[${PYTHON_USEDEP}] )
	raincloud? ( ~dev-python/raincloudy-0.0.7[${PYTHON_USEDEP}] )
	rainforest_eagle? ( ~dev-python/eagle200-reader-0.2.4[${PYTHON_USEDEP}] ~dev-python/uEagle-0.0.1[${PYTHON_USEDEP}] )
	rainmachine? ( ~dev-python/regenmaschine-2.1.0[${PYTHON_USEDEP}] )
	raspihats? ( ~dev-python/raspihats-2.2.3[${PYTHON_USEDEP}] ~dev-python/smbus-cffi-0.5.1[${PYTHON_USEDEP}] )
	raspyrfm? ( ~dev-python/raspyrfm-client-1.2.8[${PYTHON_USEDEP}] )
	recollect_waste? ( ~dev-python/recollect-waste-1.0.1[${PYTHON_USEDEP}] )
	recorder? ( ~dev-python/sqlalchemy-1.3.19[${PYTHON_USEDEP}] )
	recswitch? ( ~dev-python/pyrecswitch-1.0.2[${PYTHON_USEDEP}] )
	reddit? ( ~dev-python/praw-7.1.0[${PYTHON_USEDEP}] )
	rejseplanen? ( ~dev-python/rjpl-0.3.6[${PYTHON_USEDEP}] )
	remember_the_milk? ( ~dev-python/RtmAPI-0.7.2[${PYTHON_USEDEP}] ~dev-python/httplib2-0.10.3[${PYTHON_USEDEP}] )
	remote_rpi_gpio? ( ~dev-python/gpiozero-1.5.1[${PYTHON_USEDEP}] )
	repetier? ( ~dev-python/pyrepetier-3.0.5[${PYTHON_USEDEP}] )
	rest? ( ~dev-python/jsonpath-0.82[${PYTHON_USEDEP}] ~dev-python/xmltodict-0.12.0[${PYTHON_USEDEP}] )
	rflink? ( ~dev-python/rflink-0.0.54[${PYTHON_USEDEP}] )
	rfxtrx? ( ~dev-python/pyRFXtrx-0.25.0[${PYTHON_USEDEP}] )
	ring? ( ~dev-python/ring-doorbell-0.6.0[${PYTHON_USEDEP}] )
	ripple? ( ~dev-python/python-ripple-api-0.0.3[${PYTHON_USEDEP}] )
	risco? ( ~dev-python/pyrisco-0.3.1[${PYTHON_USEDEP}] )
	rmvtransport? ( ~dev-python/PyRMVtransport-0.2.9[${PYTHON_USEDEP}] )
	rocketchat? ( ~dev-python/rocketchat-API-0.6.1[${PYTHON_USEDEP}] )
	roku? ( ~dev-python/rokuecp-0.6.0[${PYTHON_USEDEP}] )
	roomba? ( ~dev-python/roombapy-1.6.1[${PYTHON_USEDEP}] )
	roon? ( ~dev-python/roonapi-0.0.21[${PYTHON_USEDEP}] )
	route53? ( ~dev-python/boto3-1.9.252[${PYTHON_USEDEP}] )
	rova? ( ~dev-python/rova-0.1.0[${PYTHON_USEDEP}] )
	rpi_gpio? ( ~dev-python/RPi-GPIO-0.7.0[${PYTHON_USEDEP}] )
	rpi_gpio_pwm? ( ~dev-python/pwmled-1.5.0[${PYTHON_USEDEP}] )
	rpi_pfio? ( ~dev-python/pifacecommon-4.2.2[${PYTHON_USEDEP}] ~dev-python/pifacedigitalio-3.0.5[${PYTHON_USEDEP}] )
	rpi_rf? ( ~dev-python/rpi-rf-0.9.7[${PYTHON_USEDEP}] )
	russound_rio? ( ~dev-python/russound-rio-0.1.7[${PYTHON_USEDEP}] )
	russound_rnet? ( ~dev-python/russound-0.1.9[${PYTHON_USEDEP}] )
	sabnzbd? ( ~dev-python/pysabnzbd-1.1.0[${PYTHON_USEDEP}] )
	saj? ( ~dev-python/pysaj-0.0.16[${PYTHON_USEDEP}] )
	salt? ( ~dev-python/saltbox-0.1.3[${PYTHON_USEDEP}] )
	samsungtv? ( ~dev-python/samsungctl-0.7.1[${PYTHON_USEDEP}] ~dev-python/samsungtvws-1.4.0[${PYTHON_USEDEP}] )
	satel_integra? ( ~dev-python/satel-integra-0.3.4[${PYTHON_USEDEP}] )
	schluter? ( ~dev-python/py-schluter-0.1.7[${PYTHON_USEDEP}] )
	scrape? ( ~dev-python/beautifulsoup-4.9.1[${PYTHON_USEDEP}] )
	scsgate? ( ~dev-python/scsgate-0.1.0[${PYTHON_USEDEP}] )
	season? ( ~dev-python/ephem-3.7.7.0[${PYTHON_USEDEP}] )
	sendgrid? ( ~dev-python/sendgrid-6.4.6[${PYTHON_USEDEP}] )
	sense? ( ~dev-python/sense-energy-0.8.0[${PYTHON_USEDEP}] )
	sensehat? ( ~dev-python/python-sense-hat-2.2.0[${PYTHON_USEDEP}] )
	sensibo? ( ~dev-python/pysensibo-1.0.3[${PYTHON_USEDEP}] )
	sentry? ( ~dev-python/sentry-sdk-0.17.3[${PYTHON_USEDEP}] )
	serial? ( ~dev-python/pyserial-asyncio-0.4[${PYTHON_USEDEP}] )
	serial_pm? ( ~dev-python/pmsensor-0.4[${PYTHON_USEDEP}] )
	sesame? ( ~dev-python/pysesame2-1.0.1[${PYTHON_USEDEP}] )
	seventeentrack? ( ~dev-python/py17track-2.2.2[${PYTHON_USEDEP}] )
	seven_segments? ( ~dev-python/pillow-7.2.0[${PYTHON_USEDEP}] )
	sharkiq? ( ~dev-python/sharkiqpy-0.1.8[${PYTHON_USEDEP}] )
	shelly? ( ~dev-python/aioshelly-0.3.2[${PYTHON_USEDEP}] )
	shiftr? ( ~dev-python/paho-mqtt-1.5.0[${PYTHON_USEDEP}] )
	shodan? ( ~dev-python/shodan-1.23.0[${PYTHON_USEDEP}] )
	sht31? ( ~dev-python/Adafruit-GPIO-1.0.3[${PYTHON_USEDEP}] ~dev-python/Adafruit-SHT31-1.0.2[${PYTHON_USEDEP}] )
	sighthound? ( ~dev-python/pillow-7.2.0[${PYTHON_USEDEP}] ~dev-python/simplehound-0.3[${PYTHON_USEDEP}] )
	signal_messenger? ( ~dev-python/pysignalclirestapi-0.3.4[${PYTHON_USEDEP}] )
	simplepush? ( ~dev-python/simplepush-1.1.4[${PYTHON_USEDEP}] )
	simplisafe? ( ~dev-python/simplisafe-python-9.3.0[${PYTHON_USEDEP}] )
	sinch? ( ~dev-python/clx-sdk-xms-1.0.0[${PYTHON_USEDEP}] )
	sisyphus? ( ~dev-python/sisyphus-control-2.2.1[${PYTHON_USEDEP}] )
	skybeacon? ( ~dev-python/pygatt-4.0.5[${PYTHON_USEDEP}] )
	skybell? ( ~dev-python/skybellpy-0.6.1[${PYTHON_USEDEP}] )
	sky_hub? ( ~dev-python/pyskyqhub-0.1.3[${PYTHON_USEDEP}] )
	slack? ( ~dev-python/slackclient-2.5.0[${PYTHON_USEDEP}] )
	sleepiq? ( ~dev-python/sleepyq-0.7[${PYTHON_USEDEP}] )
	slide? ( ~dev-python/goslide-api-0.5.1[${PYTHON_USEDEP}] )
	sma? ( ~dev-python/pysma-0.3.5[${PYTHON_USEDEP}] )
	smappee? ( ~dev-python/pysmappee-0.2.13[${PYTHON_USEDEP}] )
	smarthab? ( ~dev-python/SmartHab-0.21[${PYTHON_USEDEP}] )
	smartthings? ( ~dev-python/pysmartapp-0.3.2[${PYTHON_USEDEP}] ~dev-python/pysmartthings-0.7.3[${PYTHON_USEDEP}] )
	smarty? ( ~dev-python/pysmarty-0.8[${PYTHON_USEDEP}] )
	smart_meter_texas? ( ~dev-python/smart-meter-texas-0.4.0[${PYTHON_USEDEP}] )
	smhi? ( ~dev-python/smhi-pkg-1.0.13[${PYTHON_USEDEP}] )
	sms? ( ~dev-python/python-gammu-3.1[${PYTHON_USEDEP}] )
	snapcast? ( ~dev-python/snapcast-2.0.10[${PYTHON_USEDEP}] )
	snmp? ( ~dev-python/pysnmp-4.4.12[${PYTHON_USEDEP}] )
	socat? ( net-misc/socat )
	sochain? ( ~dev-python/python-sochain-api-0.0.2[${PYTHON_USEDEP}] )
	socialblade? ( ~dev-python/socialbladeclient-0.5[${PYTHON_USEDEP}] )
	solaredge? ( ~dev-python/solaredge-0.0.2[${PYTHON_USEDEP}] ~dev-python/stringcase-1.2.0[${PYTHON_USEDEP}] )
	solaredge_local? ( ~dev-python/solaredge-local-0.2.0[${PYTHON_USEDEP}] )
	solarlog? ( ~dev-python/sunwatcher-0.2.1[${PYTHON_USEDEP}] )
	solax? ( ~dev-python/solax-0.2.3[${PYTHON_USEDEP}] )
	soma? ( ~dev-python/pysoma-0.0.10[${PYTHON_USEDEP}] )
	somfy? ( ~dev-python/pymfy-0.9.0[${PYTHON_USEDEP}] )
	somfy_mylink? ( ~dev-python/somfy-mylink-synergy-1.0.6[${PYTHON_USEDEP}] )
	sonarr? ( ~dev-python/sonarr-0.2.3[${PYTHON_USEDEP}] )
	songpal? ( ~dev-python/python-songpal-0.12[${PYTHON_USEDEP}] )
	sonos? ( ~dev-python/pysonos-0.0.33[${PYTHON_USEDEP}] )
	sony_projector? ( ~dev-python/pySDCP-1[${PYTHON_USEDEP}] )
	soundtouch? ( ~dev-python/libsoundtouch-0.8.0[${PYTHON_USEDEP}] )
	spc? ( ~dev-python/pyspcwebgw-0.4.0[${PYTHON_USEDEP}] )
	speedtestdotnet? ( ~net-analyzer/speedtest-cli-2.1.2[${PYTHON_USEDEP}] )
	spider? ( ~dev-python/spiderpy-1.3.1[${PYTHON_USEDEP}] )
	spotcrime? ( ~dev-python/spotcrime-1.0.4[${PYTHON_USEDEP}] )
	spotify? ( ~dev-python/spotipy-2.14.0[${PYTHON_USEDEP}] )
	sql? ( ~dev-python/sqlalchemy-1.3.19[${PYTHON_USEDEP}] )
	squeezebox? ( ~dev-python/pysqueezebox-0.3.1[${PYTHON_USEDEP}] )
	ssdp? ( ~dev-python/defusedxml-0.6.0[${PYTHON_USEDEP}] ~dev-python/netdisco-2.8.2[${PYTHON_USEDEP}] )
	ssl? ( dev-libs/openssl app-crypt/certbot net-proxy/haproxy )
	starline? ( ~dev-python/starline-0.1.3[${PYTHON_USEDEP}] )
	starlingbank? ( ~dev-python/starlingbank-3.2[${PYTHON_USEDEP}] )
	startca? ( ~dev-python/xmltodict-0.12.0[${PYTHON_USEDEP}] )
	statsd? ( ~dev-python/statsd-3.2.1[${PYTHON_USEDEP}] )
	steam_online? ( ~dev-python/steamodd-4.21[${PYTHON_USEDEP}] )
	stiebel_eltron? ( ~dev-python/pystiebeleltron-0.0.1[${PYTHON_USEDEP}] )
	stookalert? ( ~dev-python/stookalert-0.1.4[${PYTHON_USEDEP}] )
	stream? ( ~dev-python/av-8.0.2[${PYTHON_USEDEP}] )
	streamlabswater? ( ~dev-python/streamlabswater-1.0.1[${PYTHON_USEDEP}] )
	suez_water? ( ~dev-python/pysuez-0.1.19[${PYTHON_USEDEP}] )
	supla? ( ~dev-python/asyncpysupla-0.0.5[${PYTHON_USEDEP}] )
	surepetcare? ( ~dev-python/surepy-0.2.5[${PYTHON_USEDEP}] )
	swiss_hydrological_data? ( ~dev-python/swisshydrodata-0.0.3[${PYTHON_USEDEP}] )
	swiss_public_transport? ( ~dev-python/python_opendata_transport-0.2.1[${PYTHON_USEDEP}] )
	switchbot? ( ~dev-python/PySwitchbot-0.8.0[${PYTHON_USEDEP}] )
	switcher_kis? ( ~dev-python/aioswitcher-1.2.1[${PYTHON_USEDEP}] )
	switchmate? ( ~dev-python/PySwitchmate-0.4.6[${PYTHON_USEDEP}] )
	syncthru? ( ~dev-python/PySyncThru-0.7.0[${PYTHON_USEDEP}] ~dev-python/url-normalize-1.4.1[${PYTHON_USEDEP}] )
	synology? ( ~dev-python/py-synology-0.2.0[${PYTHON_USEDEP}] )
	synology_dsm? ( ~dev-python/python-synology-0.8.2[${PYTHON_USEDEP}] )
	synology_srm? ( ~dev-python/synology-srm-0.2.0[${PYTHON_USEDEP}] )
	systemmonitor? ( ~dev-python/psutil-5.7.2[${PYTHON_USEDEP}] )
	tado? ( ~dev-python/python-tado-0.8.1[${PYTHON_USEDEP}] )
	tahoma? ( ~dev-python/tahoma-api-0.0.16[${PYTHON_USEDEP}] )
	tankerkoenig? ( ~dev-python/pytankerkoenig-0.0.6[${PYTHON_USEDEP}] )
	tank_utility? ( ~dev-python/tank_utility-1.4.0[${PYTHON_USEDEP}] )
	tapsaff? ( ~dev-python/tapsaff-0.2.1[${PYTHON_USEDEP}] )
	tautulli? ( ~dev-python/pytautulli-0.5.0[${PYTHON_USEDEP}] )
	ted5000? ( ~dev-python/xmltodict-0.12.0[${PYTHON_USEDEP}] )
	telegram_bot? ( ~dev-python/python-telegram-bot-11.1.0[${PYTHON_USEDEP}] ~dev-python/PySocks-1.7.1[${PYTHON_USEDEP}] )
	tellduslive? ( ~dev-python/tellduslive-0.10.11[${PYTHON_USEDEP}] )
	tellstick? ( ~dev-python/tellcore-net-0.4[${PYTHON_USEDEP}] ~dev-python/tellcore-py-1.1.2[${PYTHON_USEDEP}] )
	temper? ( ~dev-python/temperusb-1.5.3[${PYTHON_USEDEP}] )
	tensorflow? ( ~dev-python/pycocotools-2.0.1[${PYTHON_USEDEP}] ~dev-python/numpy-1.19.1[${PYTHON_USEDEP}] ~dev-python/pillow-7.2.0[${PYTHON_USEDEP}] )
	tesla? ( ~dev-python/teslajsonpy-0.10.4[${PYTHON_USEDEP}] )
	tfiac? ( ~dev-python/pytfiac-0.4[${PYTHON_USEDEP}] )
	thermoworks_smoke? ( ~dev-python/stringcase-1.2.0[${PYTHON_USEDEP}] ~dev-python/thermoworks-smoke-0.1.8[${PYTHON_USEDEP}] )
	thingspeak? ( ~dev-python/thingspeak-1.0.0[${PYTHON_USEDEP}] )
	thinkingcleaner? ( ~dev-python/pythinkingcleaner-0.0.3[${PYTHON_USEDEP}] )
	tibber? ( ~dev-python/pyTibber-0.14.0[${PYTHON_USEDEP}] )
	tikteck? ( ~dev-python/tikteck-0.4[${PYTHON_USEDEP}] )
	tile? ( ~dev-python/pytile-4.0.0[${PYTHON_USEDEP}] )
	tmb? ( ~dev-python/tmb-0.0.4[${PYTHON_USEDEP}] )
	todoist? ( ~dev-python/todoist-python-8.0.0[${PYTHON_USEDEP}] )
	tof? ( ~dev-python/VL53L1X2-0.1.5[${PYTHON_USEDEP}] )
	toon? ( ~dev-python/toonapi-0.2.0[${PYTHON_USEDEP}] )
	totalconnect? ( ~dev-python/total-connect-client-0.55.1[${PYTHON_USEDEP}] )
	touchline? ( ~dev-python/pytouchline-0.7[${PYTHON_USEDEP}] )
	tplink? ( ~dev-python/pyHS100-0.3.5.1[${PYTHON_USEDEP}] )
	tplink_lte? ( ~dev-python/tp-connected-0.0.4[${PYTHON_USEDEP}] )
	traccar? ( ~dev-python/pytraccar-0.9.0[${PYTHON_USEDEP}] ~dev-python/stringcase-1.2.0[${PYTHON_USEDEP}] )
	trackr? ( ~dev-python/pytrackr-0.0.5[${PYTHON_USEDEP}] )
	tradfri? ( ~dev-python/pytradfri-7.0.2[${PYTHON_USEDEP}] )
	trafikverket_train? ( ~dev-python/pytrafikverket-0.1.6.2[${PYTHON_USEDEP}] )
	trafikverket_weatherstation? ( ~dev-python/pytrafikverket-0.1.6.2[${PYTHON_USEDEP}] )
	transmission? ( ~dev-python/transmissionrpc-0.11[${PYTHON_USEDEP}] )
	transport_nsw? ( ~dev-python/PyTransportNSW-0.1.1[${PYTHON_USEDEP}] )
	travisci? ( ~dev-python/TravisPy-0.3.5[${PYTHON_USEDEP}] )
	trend? ( ~dev-python/numpy-1.19.1[${PYTHON_USEDEP}] )
	tts? ( ~media-libs/mutagen-1.45.1 )
	tuya? ( ~dev-python/tuyaha-0.0.7[${PYTHON_USEDEP}] )
	twentemilieu? ( ~dev-python/twentemilieu-0.3.0[${PYTHON_USEDEP}] )
	twilio? ( ~dev-python/twilio-6.32.0[${PYTHON_USEDEP}] )
	twitch? ( ~dev-python/python-twitch-client-0.6.0[${PYTHON_USEDEP}] )
	twitter? ( ~dev-python/TwitterAPI-2.5.13[${PYTHON_USEDEP}] )
	ubee? ( ~dev-python/pyubee-0.10[${PYTHON_USEDEP}] )
	unifi? ( ~dev-python/aiounifi-23[${PYTHON_USEDEP}] )
	unifiled? ( ~dev-python/unifiled-0.11[${PYTHON_USEDEP}] )
	unifi_direct? ( ~dev-python/pexpect-4.6.0[${PYTHON_USEDEP}] )
	upb? ( ~dev-python/upb-lib-0.4.11[${PYTHON_USEDEP}] )
	upcloud? ( ~dev-python/upcloud-api-0.4.5[${PYTHON_USEDEP}] )
	upc_connect? ( ~dev-python/connect-box-0.2.8[${PYTHON_USEDEP}] )
	updater? ( ~dev-python/distro-1.5.0[${PYTHON_USEDEP}] )
	upnp? ( ~dev-python/async-upnp-client-0.14.13[${PYTHON_USEDEP}] )
	uscis? ( ~dev-python/uscisstatus-0.1.1[${PYTHON_USEDEP}] )
	usgs_earthquakes_feed? ( ~dev-python/geojson-client-0.4[${PYTHON_USEDEP}] )
	uvc? ( ~dev-python/uvcclient-0.11.0[${PYTHON_USEDEP}] )
	vallox? ( ~dev-python/vallox-websocket-api-2.4.0[${PYTHON_USEDEP}] )
	vasttrafik? ( ~dev-python/vtjp-0.1.14[${PYTHON_USEDEP}] )
	velbus? ( ~dev-python/python-velbus-2.0.44[${PYTHON_USEDEP}] )
	velux? ( ~dev-python/pyvlx-0.2.17[${PYTHON_USEDEP}] )
	venstar? ( ~dev-python/venstarcolortouch-0.12[${PYTHON_USEDEP}] )
	vera? ( ~dev-python/pyvera-0.3.10[${PYTHON_USEDEP}] )
	verisure? ( ~dev-python/jsonpath-0.82[${PYTHON_USEDEP}] ~dev-python/vsure-1.5.4[${PYTHON_USEDEP}] )
	versasense? ( ~dev-python/pyversasense-0.0.6[${PYTHON_USEDEP}] )
	version? ( ~dev-python/pyhaversion-3.4.2[${PYTHON_USEDEP}] )
	vesync? ( ~dev-python/pyvesync-1.1.0[${PYTHON_USEDEP}] )
	vicare? ( ~dev-python/PyViCare-0.2.0[${PYTHON_USEDEP}] )
	vilfo? ( ~dev-python/vilfo-api-client-0.3.2[${PYTHON_USEDEP}] )
	vivotek? ( ~dev-python/libpyvivotek-0.4.0[${PYTHON_USEDEP}] )
	vizio? ( ~dev-python/pyvizio-0.1.56[${PYTHON_USEDEP}] )
	vlc? ( ~dev-python/python-vlc-1.1.2[${PYTHON_USEDEP}] )
	vlc_telnet? ( ~dev-python/python-telnet-vlc-1.0.4[${PYTHON_USEDEP}] )
	volkszaehler? ( ~dev-python/volkszaehler-0.1.3[${PYTHON_USEDEP}] )
	volumio? ( ~dev-python/pyvolumio-0.1.2[${PYTHON_USEDEP}] )
	volvooncall? ( ~dev-python/volvooncall-0.8.12[${PYTHON_USEDEP}] )
	vultr? ( ~dev-python/vultr-0.1.2[${PYTHON_USEDEP}] )
	w800rf32? ( ~dev-python/pyW800rf32-0.1[${PYTHON_USEDEP}] )
	wake_on_lan? ( ~dev-python/wakeonlan-1.1.6[${PYTHON_USEDEP}] )
	waqi? ( ~dev-python/waqiasync-1.0.0[${PYTHON_USEDEP}] )
	waterfurnace? ( ~dev-python/waterfurnace-1.1.0[${PYTHON_USEDEP}] )
	watson_iot? ( ~dev-python/ibmiotf-0.3.4[${PYTHON_USEDEP}] )
	watson_tts? ( ~dev-python/ibm-watson-4.0.1[${PYTHON_USEDEP}] )
	waze_travel_time? ( ~dev-python/WazeRouteCalculator-0.12[${PYTHON_USEDEP}] )
	webostv? ( ~dev-python/aiopylgtv-0.3.3[${PYTHON_USEDEP}] )
	wemo? ( ~dev-python/pywemo-0.4.46[${PYTHON_USEDEP}] )
	whois? ( ~dev-python/python-whois-0.7.3[${PYTHON_USEDEP}] )
	wiffi? ( ~dev-python/wiffi-1.0.1[${PYTHON_USEDEP}] )
	wilight? ( ~dev-python/pywilight-0.0.65[${PYTHON_USEDEP}] )
	wink? ( ~dev-python/pubnubsub-handler-1.0.8[${PYTHON_USEDEP}] ~dev-python/python-wink-1.10.5[${PYTHON_USEDEP}] )
	wirelesstag? ( ~dev-python/wirelesstagpy-0.4.1[${PYTHON_USEDEP}] )
	withings? ( ~dev-python/withings-api-2.1.6[${PYTHON_USEDEP}] )
	wled? ( ~dev-python/wled-0.4.4[${PYTHON_USEDEP}] )
	wolflink? ( ~dev-python/wolf_smartset-0.1.4[${PYTHON_USEDEP}] )
	workday? ( ~dev-python/holidays-0.10.3[${PYTHON_USEDEP}] )
	xbee? ( ~dev-python/xbee-helper-0.0.7[${PYTHON_USEDEP}] )
	xbox_live? ( ~dev-python/xboxapi-2.0.1[${PYTHON_USEDEP}] )
	xeoma? ( ~dev-python/pyxeoma-1.4.1[${PYTHON_USEDEP}] )
	xfinity? ( ~dev-python/xfinity-gateway-0.0.4[${PYTHON_USEDEP}] )
	xiaomi_aqara? ( ~dev-python/PyXiaomiGateway-0.13.2[${PYTHON_USEDEP}] )
	xiaomi_miio? ( ~dev-python/construct-2.9.45[${PYTHON_USEDEP}] ~dev-python/python-miio-0.5.3[${PYTHON_USEDEP}] )
	xiaomi_tv? ( ~dev-python/pymitv-1.4.3[${PYTHON_USEDEP}] )
	xmpp? ( ~dev-python/slixmpp-1.5.2[${PYTHON_USEDEP}] )
	xs1? ( ~dev-python/xs1-api-client-3.0.0[${PYTHON_USEDEP}] )
	yale_smart_alarm? ( ~dev-python/yalesmartalarmclient-0.1.6[${PYTHON_USEDEP}] )
	yamaha? ( ~dev-python/rxv-0.6.0[${PYTHON_USEDEP}] )
	yamaha_musiccast? ( ~dev-python/pymusiccast-0.1.6[${PYTHON_USEDEP}] )
	yandex_transport? ( ~dev-python/aioymaps-1.1.0[${PYTHON_USEDEP}] )
	yeelight? ( ~dev-python/yeelight-0.5.3[${PYTHON_USEDEP}] )
	yeelightsunflower? ( ~dev-python/yeelightsunflower-0.0.10[${PYTHON_USEDEP}] )
	yessssms? ( ~dev-python/YesssSMS-0.4.1[${PYTHON_USEDEP}] )
	yi? ( ~dev-python/aioftp-0.12.0[${PYTHON_USEDEP}] )
	zabbix? ( ~dev-python/pyzabbix-0.7.4[${PYTHON_USEDEP}] )
	zengge? ( ~dev-python/zengge-0.2[${PYTHON_USEDEP}] )
	zeroconf? ( ~dev-python/zeroconf-0.28.5[${PYTHON_USEDEP}] )
	zerproc? ( ~dev-python/pyzerproc-0.2.5[${PYTHON_USEDEP}] )
	zestimate? ( ~dev-python/xmltodict-0.12.0[${PYTHON_USEDEP}] )
	zha? ( ~dev-python/bellows-0.20.2[${PYTHON_USEDEP}] ~dev-python/pyserial-3.4[${PYTHON_USEDEP}] ~dev-python/zha-quirks-0.0.44[${PYTHON_USEDEP}] ~dev-python/zigpy-cc-0.5.2[${PYTHON_USEDEP}] ~dev-python/zigpy-deconz-0.10.0[${PYTHON_USEDEP}] ~dev-python/zigpy-0.24.1[${PYTHON_USEDEP}] ~dev-python/zigpy-xbee-0.13.0[${PYTHON_USEDEP}] ~dev-python/zigpy-zigate-0.6.2[${PYTHON_USEDEP}] ~dev-python/zigpy-znp-0.1.1[${PYTHON_USEDEP}] )
	zhong_hong? ( ~dev-python/zhong-hong-hvac-1.0.9[${PYTHON_USEDEP}] )
	ziggo_mediabox_xl? ( ~dev-python/ziggo-mediabox-xl-1.1.0[${PYTHON_USEDEP}] )
	zoneminder? ( ~dev-python/zm-py-0.4.0[${PYTHON_USEDEP}] )
	zwave? ( ~dev-python/homeassistant-pyozw-0.1.10[${PYTHON_USEDEP}] ~dev-python/PyDispatcher-2.0.5[${PYTHON_USEDEP}] )"

BDEPEND="${RDEPEND}
	test? (
		~dev-python/astroid-2.4.2[${PYTHON_USEDEP}]
		~dev-python/asynctest-0.13.0[${PYTHON_USEDEP}]
		~dev-python/codecov-2.1.0[${PYTHON_USEDEP}]
		~dev-python/coverage-5.2.1[${PYTHON_USEDEP}]
		~dev-python/jsonpickle-1.4.1[${PYTHON_USEDEP}]
		~dev-python/mock-open-1.4.0[${PYTHON_USEDEP}]
		~dev-python/mypy-0.780[${PYTHON_USEDEP}]
		~dev-python/pipdeptree-1.0.0[${PYTHON_USEDEP}]
		~dev-python/pre-commit-2.7.1[${PYTHON_USEDEP}]
		~dev-python/pylint-strict-informational-0.1[${PYTHON_USEDEP}]
		~dev-python/pylint-2.6.0[${PYTHON_USEDEP}]
		~dev-python/pytest-aiohttp-0.3.0[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-2.10.0[${PYTHON_USEDEP}]
		~dev-python/pytest-sugar-0.9.3[${PYTHON_USEDEP}]
		~dev-python/pytest-test-groups-1.0.3[${PYTHON_USEDEP}]
		~dev-python/pytest-timeout-1.3.4[${PYTHON_USEDEP}]
		~dev-python/pytest-xdist-1.32.0[${PYTHON_USEDEP}]
		~dev-python/pytest-5.4.3[${PYTHON_USEDEP}]
		~dev-python/requests-mock-1.8.0[${PYTHON_USEDEP}]
		~dev-python/responses-0.10.6[${PYTHON_USEDEP}]
		~dev-python/stdlib-list-0.7.0[${PYTHON_USEDEP}]
		~dev-python/tqdm-4.48.2[${PYTHON_USEDEP}]
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

src_prepare() {
	# https://github.com/home-assistant/home-assistant/issues/28811
	if use maxcube_hack ; then
	  eapply "${FILESDIR}/maxcube_TypeError_01114_dirty_hack.patch"
	fi
	eapply_user
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


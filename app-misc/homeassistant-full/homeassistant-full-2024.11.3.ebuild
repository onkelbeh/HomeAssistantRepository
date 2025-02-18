# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_12 )
PYTHON_REQ_USE="sqlite?"
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
	SRC_URI="$(pypi_sdist_url)
	https://github.com/home-assistant/core/archive/${MY_PV}.tar.gz -> ${MY_P}.gh.tar.gz"
fi

DESCRIPTION="Open-source home automation platform running on Python."
HOMEPAGE="https://home-assistant.io/ https://git.edevau.net/onkelbeh/HomeAssistantRepository/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="abode accuweather acer_projector acmeda adax adguard ads advantage_air aemet aftership agent_dvr airgradient airly airnow airq airthings airthings_ble airtouch4 airtouch5 airvisual airvisual_pro airzone airzone_cloud alarmdecoder alpha_vantage amazon_polly amberelectric ambient_network ambient_station amcrest ampio analytics_insights android_ip_webcam androidtv androidtv_remote anel_pwrctrl anova anthemav anthropic aosmith apache_kafka apcupsd apple_tv apprise aprilaire aprs apsystems aquacell aqualogic aquostv aranet arcam_fmj arris_tg2492lg aruba arve aseko_pool_live +assist_pipeline asuswrt atag aten_pe atome august aurora aurora_abb_powerone aussie_broadband autarco avea avion awair aws axis azure_data_explorer azure_devops azure_event_hub azure_service_bus baf baidu balboa bang_olufsen bbox beewi_smartclim bitcoin bizkaibus blackbird blebox blink blinksticklight blockchain blue_current bluemaestro bluesound +bluetooth bluetooth_tracker bmw_connected_drive bond bosch_shc braviatv bring broadlink brother brottsplatskartan brunt bryant_evolution bsblan bt_home_hub_5 bt_smarthub bthome buienradar caldav cambridge_audio camera canary cast ccm15 chacon_dio channels cisco_ios cisco_mobility_express cisco_webex_teams clementine cli +cloud cloudflare cmus co2signal coinbase color_extractor comelit comfoconnect command_line compensation concord232 control4 +conversation coolmaster cppm_tracker cpuspeed crownstone cups daikin danfoss_air datadog deako debugpy deconz decora decora_wifi delijn deluge denonavr devialet devolo_home_control devolo_home_network dexcom +dhcp digital_ocean directv discogs discord discovergy dlib_face_detect dlib_face_identify dlink dlna_dmr dlna_dms dnsip dominos doods doorbird dormakaba_dkey dovado dremel_3d_printer drop_connect dsmr duke_energy dunehd duotecno dwd_weather_warnings dweet dynalite eafm easyenergy ebox ebusd ecoal_boiler ecobee ecoforest econet ecovacs ecowitt eddystone_temperature edimax edl21 efergy egardia electrasmart electric_kiwi elevenlabs elgato eliqonline elkm1 elmax elv elvia emby emoncms emonitor emulated_kasa emulated_roku energenie_power_sockets energyzero enigma2 enocean enphase_envoy entur_public_transport environment_canada envisalink ephember epic_games_store epion epson eq3btsmart escea esphome etherscan eufy eufylife_ble everlights evil_genius_labs evohome ezviz faa_delays familyhub fastdotcom feedreader ffmpeg fibaro fido file fints fireservicerota firmata fitbit fivem fixer fjaraskupan fleetgo flexit_bacnet flic flick_electric flipr flo flume flux_led folder_watcher foobot forecast_solar forked_daapd fortios foscam free_mobile freebox freedompro fritz fritzbox fritzbox_callmonitor fronius frontier_silicon fujitsu_fglair fully_kiosk futurenow fyta garages_amsterdam gardena_bluetooth gc100 gdacs generic geniushub geo_json_events geo_rss_events geocaching geonetnz_quakes geonetnz_volcano gios github gitlab_ci gitter glances +go2rtc goalzero gogogate2 goodwe google google_assistant_sdk google_cloud google_generative_ai_conversation google_mail google_maps google_photos google_pubsub google_sheets google_tasks google_translate google_travel_time govee_ble govee_light_local gpsd gree greeneye_monitor greenwave growatt_server gstreamer gtfs guardian habitica harman_kardon_avr harmony hassio hdmi_cec heatmiser heos here_travel_time hikvision hikvisioncam hisense_aehw4a1 hive hko hlk_sw16 holiday home_connect homekit homekit_controller homematic homematicip_cloud homewizard homeworks honeywell horizon hp_ilo html5 huawei_lte hue huisbaasje hunterdouglas_powerview husqvarna_automower husqvarna_automower_ble huum hvv_departures hydrawise hyperion ialarm iammeter iaqualink ibeacon icloud idasen_desk idteck_prox ifttt iglo ign_sismologia ihc imap imgw_pib improv_ble incomfort influxdb inkbird insteon intellifire intesishome iotawatt iotty iperf3 ipma ipp iqvia irish_rail_transport iron_os isal iskra islamic_prayer_times israel_rail iss ista_ecotrend isy994 itach izone jellyfin jewish_calendar joaoapps_join juicenet justnimbus jvc_projector kaiterra kaleidescape keba keenetic_ndms2 kef kegtron keyboard keyboard_remote keymitt_ble kira kiwi kmtronic knocki knx kodi konnected kostal_plenticore kraken kulersky kwb lacrosse lacrosse_view lamarzocco lametric landisgyr_heat_meter lastfm launch_library laundrify lcn ld2410_ble leaone led_ble lektrico lg_netcast lg_soundbar lg_thinq lidarr lifx lightwave limitlessled linear_garage_door linkplay linode linux_battery lirc litejet litterrobot livisi local_calendar local_todo london_underground lookin loqed luci luftdaten lupusec lutron lutron_caseta lw12wifi lyric madvr mailgun marytts mastodon matrix matter maxcube mealie meater medcom_ble media_extractor mediaroom melcloud melissa melnor message_bird met met_eireann meteo_france meteoalarm meteoclimatic metoffice mfi microbees microsoft mikrotik mill minecraft_server minio moat +mobile_app mochad modbus modem_callerid modern_forms moehlenhoff_alpha2 monarch_money monoprice monzo mopeka motion_blinds motionblinds_ble motioneye motionmount mpd mqtt msteams mullvad mutesync mvglive mycroft mysensors mysql mystrom mythicbeastsdns myuplink nad nam namecheapdns nanoleaf neato nederlandse_spoorwegen ness_alarm nest netatmo netdata netgear netgear_lte netio neurio_energy nexia nextbus nextcloud nextdns nfandroidtv nibe_heatpump nice_go nightscout niko_home_control nilu nina nissan_leaf nmap_tracker nmbs noaa_tides nobo_hub norway_air notify_events notion nsw_fuel_station nsw_rural_fire_service_feed nuheat nuki numato nut nws nx584 nyt_games nzbget oasa_telematics obihai octoprint oem ohmconnect ollama ombi omnilogic oncue ondilo_ico onewire onkyo onvif open_meteo openai_conversation openerz openevse openexchangerates opengarage openhome opensensemap opensky opentherm_gw openuv openweathermap opnsense opower opple oralb oru orvibo osoenergy osramlightify otbr otp ourgroceries overkiz ovo_energy owntracks p1_monitor palazzetti panasonic_bluray panasonic_viera pandora peco pegel_online pencom permobil philips_js pi_hole picnic pilight ping pjlink plaato plex plugwise plum_lightpad pocketcasts point poolsense postgres powerwall private_ble_device profiler progettihwsw proliphix prometheus prosegur proxmoxve proxy prusalink ps4 pulseaudio_loopback pure_energie purpleair pushbullet pushover pvoutput pvpc_hourly_pricing pyload python_script qbittorrent qingping qld_bushfire qnap qnap_qsw qrcode quantum_gateway qvr_pro qwikswitch rabbitair rachio radarr radio_browser radiotherm rainbird raincloud rainforest_eagle rainforest_raven rainmachine rapt_ble raspyrfm rdw recollect_waste recorder recswitch reddit refoss rejseplanen remember_the_milk remote_rpi_gpio renault renson reolink repetier rest rflink rfxtrx ridwell ring ripple risco rituals_perfume_genie rmvtransport roborock rocketchat roku romy roomba roon route53 rova rpi_power rtsp_to_webrtc ruckus_unleashed russound_rio russound_rnet ruuvi_gateway ruuvitag_ble rympro sabnzbd saj samsungtv sanix satel_integra schlage schluter scrape screenlogic scsgate season sendgrid sense sensibo sensirion_ble sensorpro sensorpush sensoterra sentry senz serial serial_pm sesame seven_segments seventeentrack sfr_box sharkiq shelly shodan sia sighthound signal_messenger simplefin simplepush simplisafe sinch sisyphus sky_hub skybeacon skybell slack sleepiq slide slimproto sma smappee smart_meter_texas smartthings smarttub smarty smhi smlight sms snapcast snmp snooz socat solaredge solaredge_local solarlog solax soma somfy_mylink sonarr songpal sonos sony_projector soundtouch spc speedtestdotnet splunk spotify sql +sqlite squeezebox srp_energy +ssdp ssl starline starlingbank starlink startca statsd steam_online steamist stiebel_eltron stookalert stookwijzer +stream streamlabswater subaru suez_water sunweg supla surepetcare swiss_hydrological_data swiss_public_transport switchbee switchbot switchbot_cloud switcher_kis switchmate syncthing syncthru synology_dsm synology_srm system_bridge systemd systemmonitor tado tailscale tailwind tami4 tank_utility tankerkoenig tapsaff tasmota tautulli technove ted5000 tedee telegram_bot tellduslive tellstick temper tensorflow tesla_fleet tesla_wall_connector teslemetry tessie tfiac thermobeacon thermopro thermoworks_smoke thethingsnetwork thingspeak thinkingcleaner thread tibber tikteck tile tilt_ble tmb todoist tolo tomorrowio toon totalconnect touchline touchline_sl tplink tplink_lte tplink_omada traccar traccar_server tractive tradfri trafikverket_camera trafikverket_ferry trafikverket_train trafikverket_weatherstation transmission transport_nsw travisci trend triggercmd tts tuya twentemilieu twilio twinkly twitch twitter ubus ukraine_alarm unifi unifi_direct unifiled unifiprotect upb upc_connect upcloud upnp uptimerobot +usb usgs_earthquakes_feed utility_meter uvc v2c vallox vasttrafik velbus velux venstar vera verisure versasense version vesync vicare vilfo vivotek vizio vlc vlc_telnet vodafone_station voip volkszaehler volumio volvooncall vulcan vultr w800rf32 wake_on_lan wallbox waqi waterfurnace watson_iot watson_tts watttime waze_travel_time weatherflow weatherflow_cloud weatherkit webmin webostv weheat wemo whirlpool whois wiffi wilight wirelesstag withings wiz wled wmspro wolflink workday ws66i wyoming xbox xeoma xiaomi_aqara xiaomi_ble xiaomi_miio xiaomi_tv xmpp xs1 yale yale_smart_alarm yalexs_ble yamaha yamaha_musiccast yandex_transport yardian yeelight yeelightsunflower yi yolink youless youtube zabbix zamg zengge +zeroconf zerproc zestimate zeversolar zha zhong_hong ziggo_mediabox_xl zoneminder zwave_js zwave_me"
RESTRICT="!test? ( test )"

# external deps
RDEPEND="${PYTHON_DEPS}
	acct-group/${MY_PN} acct-user/${MY_PN}
	app-admin/logrotate"
# make sure no conflicting main ebuild is installed
RDEPEND="${RDEPEND}
	!app-misc/homeassistant-min
	!app-misc/homeassistant"

# core requirements (cf requirements.txt)
RDEPEND="${RDEPEND}
	~dev-python/aiodns-3.2.0[${PYTHON_USEDEP}]
	~dev-python/aiohasupervisor-0.2.1[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.10.11[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-fast-zlib-0.1.1[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/aiozoneinfo-0.2.1[${PYTHON_USEDEP}]
	>=dev-python/astral-2.2[${PYTHON_USEDEP}]
	>=dev-python/async-interrupt-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/atomicwrites-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/attrs-24.2.0[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-24.6.0[${PYTHON_USEDEP}]
	>=dev-python/bcrypt-4.2.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2021.5.30[${PYTHON_USEDEP}]
	>=dev-python/ciso8601-2.3.1[${PYTHON_USEDEP}]
	>=dev-python/cryptography-43.0.1[${PYTHON_USEDEP}]
	~dev-python/fnv-hash-fast-1.0.2[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.83.0[${PYTHON_USEDEP}]
	>=dev-python/home-assistant-bluetooth-1.13.0[${PYTHON_USEDEP}]
	~dev-python/home-assistant-frontend-20241106.2[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27.2[${PYTHON_USEDEP}]
	~dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.4[${PYTHON_USEDEP}]
	>=dev-python/lru-dict-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.10.10[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.1[${PYTHON_USEDEP}]
	~dev-python/pillow-10.4.0[${PYTHON_USEDEP}]
	>=dev-python/propcache-0.2.0[${PYTHON_USEDEP}]
	~dev-python/psutil-home-assistant-0.0.1[${PYTHON_USEDEP}]
	~dev-python/pyjwt-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-24.2.1[${PYTHON_USEDEP}]
	>=dev-python/python-slugify-8.0.4[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	~dev-python/securetar-2024.2.1[${PYTHON_USEDEP}]
	~dev-python/sqlalchemy-2.0.31[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}] <dev-python/typing-extensions-5.0[${PYTHON_USEDEP}]
	>=dev-python/ulid-transform-1.0.2[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.5[${PYTHON_USEDEP}]
	>=dev-python/uv-0.4.28
	>=dev-python/voluptuous-0.15.2[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-openapi-0.0.5[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-serialize-2.6.0[${PYTHON_USEDEP}]
	>=dev-python/webrtc-models-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.17.1[${PYTHON_USEDEP}]"

# blockers (cf package_constraints.txt, but (usually) inversed)
RDEPEND="${RDEPEND}
	!<dev-python/anyio-4.6.2_p1
	!<dev-python/async-timeout-4.0.3
	!<dev-python/backoff-2.0
	!<dev-python/btlewrap-0.0.10
	!dev-python/cchardet
	!<dev-python/chacha20poly1305-reuseable-0.13.0
	!<dev-python/charset-normalizer-3.2.0
	!<dev-python/dacite-1.7.0
	!dev-python/enum34
	!<dev-python/faust-cchardet-2.1.18
	!dev-python/get-mac
	!<dev-python/grpcio-1.66.2
	!<dev-python/grpcio-reflection-1.66.2
	!<dev-python/grpcio-status-1.66.2
	!<dev-python/h11-0.14.0
	!<dev-python/httpcore-1.0.5
	!<dev-python/hyperframe-5.2.0
	!<=dev-python/iso4217-1.10.20220401
	!<dev-python/mashumaro-3.13.1
	!<dev-python/multidict-6.0.2
	!<dev-python/pandas-2.1.4
	!<dev-python/protobuf-5.28.3
	!<=dev-python/pubnub-6.4.0
	!dev-python/pycrypto
	!<dev-python/pycryptodome-3.6.6
	!dev-python/pysnmplib
	!<dev-python/scapy-2.5.0
	!<=dev-python/tenacity-8.4.0
	!<dev-python/tuf-4.0.0
	!dev-python/typing
	!dev-python/uuid
	!<dev-python/websockets-11.0.1"

# use dependencies (cf manifest.json dependencies)
REQUIRED_USE="
	|| ( sqlite postgres mysql )
	airvisual? ( airvisual_pro )
	amcrest? ( ffmpeg )
	anthropic? ( conversation )
	apple_tv? ( zeroconf )
	assist_pipeline? ( conversation tts )
	bluetooth? ( usb )
	canary? ( ffmpeg )
	deako? ( zeroconf )
	dlna_dmr? ( ssdp )
	dlna_dms? ( ssdp )
	drop_connect? ( mqtt )
	duke_energy? ( recorder )
	elvia? ( recorder )
	eq3btsmart? ( bluetooth )
	esphome? ( assist_pipeline bluetooth ffmpeg )
	ezviz? ( ffmpeg )
	freebox? ( ffmpeg )
	go2rtc? ( camera )
	google_generative_ai_conversation? ( conversation )
	homekit? ( ffmpeg )
	homekit_controller? ( zeroconf )
	landisgyr_heat_meter? ( usb )
	modem_callerid? ( usb )
	nest? ( ffmpeg )
	ollama? ( conversation )
	onvif? ( ffmpeg )
	openai_conversation? ( conversation )
	opower? ( recorder )
	otbr? ( thread )
	rainforest_raven? ( usb )
	ring? ( ffmpeg )
	rtsp_to_webrtc? ( camera )
	ruuvi_gateway? ( bluetooth )
	samsungtv? ( ssdp )
	shelly? ( bluetooth )
	skybell? ( ffmpeg )
	sonos? ( ssdp )
	stiebel_eltron? ( modbus )
	tasmota? ( mqtt )
	thread? ( zeroconf )
	tibber? ( recorder )
	tts? ( ffmpeg )
	tuya? ( ffmpeg )
	upnp? ( ssdp )
	velbus? ( usb )
	voip? ( assist_pipeline )
	wyoming? ( assist_pipeline conversation )
	yale? ( cloud )
	yamaha_musiccast? ( ssdp )
	yi? ( ffmpeg )
	zwave_js? ( usb )"

# module requirements from useflags
RDEPEND="${RDEPEND}
	abode? ( ~dev-python/jaraco-abode-6.2.1[${PYTHON_USEDEP}] )
	accuweather? ( ~dev-python/accuweather-3.0.0[${PYTHON_USEDEP}] )
	acer_projector? ( ~dev-python/pyserial-3.5[${PYTHON_USEDEP}] )
	acmeda? ( ~dev-python/aiopulse-0.4.6[${PYTHON_USEDEP}] )
	adax? ( ~dev-python/Adax-local-0.1.5[${PYTHON_USEDEP}] ~dev-python/adax-0.4.0[${PYTHON_USEDEP}] )
	adguard? ( ~dev-python/adguardhome-0.7.0[${PYTHON_USEDEP}] )
	ads? ( ~dev-python/pyads-3.4.0[${PYTHON_USEDEP}] )
	advantage_air? ( ~dev-python/advantage-air-0.4.4[${PYTHON_USEDEP}] )
	aemet? ( ~dev-python/AEMET-OpenData-0.5.4[${PYTHON_USEDEP}] )
	aftership? ( ~dev-python/pyaftership-21.11.0[${PYTHON_USEDEP}] )
	agent_dvr? ( ~dev-python/agent-py-0.0.24[${PYTHON_USEDEP}] )
	airgradient? ( ~dev-python/airgradient-0.9.1[${PYTHON_USEDEP}] )
	airly? ( ~dev-python/airly-1.1.0[${PYTHON_USEDEP}] )
	airnow? ( ~dev-python/pyairnow-1.2.1[${PYTHON_USEDEP}] )
	airq? ( ~dev-python/aioairq-0.4.3[${PYTHON_USEDEP}] )
	airthings? ( ~dev-python/airthings-cloud-0.2.0[${PYTHON_USEDEP}] )
	airthings_ble? ( ~dev-python/airthings-ble-0.9.2[${PYTHON_USEDEP}] )
	airtouch4? ( ~dev-python/airtouch4pyapi-1.0.5[${PYTHON_USEDEP}] )
	airtouch5? ( ~dev-python/airtouch5py-0.2.10[${PYTHON_USEDEP}] )
	airvisual? ( ~dev-python/pyairvisual-2023.8.1[${PYTHON_USEDEP}] )
	airvisual_pro? ( ~dev-python/pyairvisual-2023.8.1[${PYTHON_USEDEP}] )
	airzone? ( ~dev-python/aioairzone-0.9.7[${PYTHON_USEDEP}] )
	airzone_cloud? ( ~dev-python/aioairzone-cloud-0.6.10[${PYTHON_USEDEP}] )
	alarmdecoder? ( ~dev-python/adext-0.4.3[${PYTHON_USEDEP}] )
	alpha_vantage? ( ~dev-python/alpha-vantage-2.3.1[${PYTHON_USEDEP}] )
	amazon_polly? ( ~dev-python/boto3-1.34.131[${PYTHON_USEDEP}] )
	amberelectric? ( ~dev-python/amberelectric-1.1.1[${PYTHON_USEDEP}] )
	ambient_network? ( ~dev-python/aioambient-2024.8.0[${PYTHON_USEDEP}] )
	ambient_station? ( ~dev-python/aioambient-2024.8.0[${PYTHON_USEDEP}] )
	amcrest? ( ~dev-python/amcrest-1.9.8[${PYTHON_USEDEP}] )
	ampio? ( ~dev-python/asmog-0.0.6[${PYTHON_USEDEP}] )
	analytics_insights? ( ~dev-python/python-homeassistant-analytics-0.8.0[${PYTHON_USEDEP}] )
	android_ip_webcam? ( ~dev-python/pydroid-ipcam-2.0.0[${PYTHON_USEDEP}] )
	androidtv? ( ~dev-python/adb-shell-0.4.4[${PYTHON_USEDEP},async] ~dev-python/androidtv-0.0.73[${PYTHON_USEDEP},async] ~dev-python/pure-python-adb-0.3.0_pre0[${PYTHON_USEDEP},async] )
	androidtv_remote? ( ~dev-python/androidtvremote2-0.1.2[${PYTHON_USEDEP}] )
	anel_pwrctrl? ( ~dev-python/anel-pwrctrl-homeassistant-0.0.1_pre2[${PYTHON_USEDEP}] )
	anova? ( ~dev-python/anova-wifi-0.17.0[${PYTHON_USEDEP}] )
	anthemav? ( ~dev-python/anthemav-1.4.1[${PYTHON_USEDEP}] )
	anthropic? ( ~dev-python/anthropic-0.31.2[${PYTHON_USEDEP}] )
	aosmith? ( ~dev-python/py-aosmith-1.0.10[${PYTHON_USEDEP}] )
	apache_kafka? ( ~dev-python/aiokafka-0.10.0[${PYTHON_USEDEP}] )
	apcupsd? ( ~dev-python/aioapcaccess-0.4.2[${PYTHON_USEDEP}] )
	apple_tv? ( ~dev-python/pyatv-0.15.1[${PYTHON_USEDEP}] )
	apprise? ( ~dev-python/apprise-1.9.0[${PYTHON_USEDEP}] )
	aprilaire? ( ~dev-python/pyaprilaire-0.7.4[${PYTHON_USEDEP}] )
	aprs? ( ~dev-python/aprslib-0.7.2[${PYTHON_USEDEP}] ~sci-geosciences/geopy-2.3.0[${PYTHON_USEDEP}] )
	apsystems? ( ~dev-python/apsystems-ez1-2.4.0[${PYTHON_USEDEP}] )
	aquacell? ( ~dev-python/aioaquacell-0.2.0[${PYTHON_USEDEP}] )
	aqualogic? ( ~dev-python/aqualogic-2.6[${PYTHON_USEDEP}] )
	aquostv? ( ~dev-python/sharp_aquos_rc-0.3.2[${PYTHON_USEDEP}] )
	aranet? ( ~dev-python/aranet4-2.4.0[${PYTHON_USEDEP}] )
	arcam_fmj? ( ~dev-python/arcam-fmj-1.5.2[${PYTHON_USEDEP}] )
	arris_tg2492lg? ( ~dev-python/arris-tg2492lg-2.2.0[${PYTHON_USEDEP}] )
	aruba? ( ~dev-python/pexpect-4.6.0[${PYTHON_USEDEP}] )
	arve? ( ~dev-python/asyncarve-0.1.1[${PYTHON_USEDEP}] )
	aseko_pool_live? ( ~dev-python/aioaseko-1.0.0[${PYTHON_USEDEP}] )
	assist_pipeline? ( ~dev-python/pymicro-vad-1.0.1[${PYTHON_USEDEP}] ~dev-python/pyspeex-noise-1.0.2[${PYTHON_USEDEP}] )
	asuswrt? ( ~dev-python/aioasuswrt-1.4.0[${PYTHON_USEDEP}] ~dev-python/pyasuswrt-0.1.21[${PYTHON_USEDEP}] )
	atag? ( ~dev-python/pyatag-0.3.5.3[${PYTHON_USEDEP}] )
	aten_pe? ( ~dev-python/atenpdu-0.3.2[${PYTHON_USEDEP}] )
	atome? ( ~dev-python/pyAtome-0.1.1[${PYTHON_USEDEP}] )
	august? ( ~dev-python/yalexs-8.10.0[${PYTHON_USEDEP}] ~dev-python/yalexs-ble-2.5.0[${PYTHON_USEDEP}] )
	aurora? ( ~dev-python/auroranoaa-0.0.5[${PYTHON_USEDEP}] )
	aurora_abb_powerone? ( ~dev-python/aurorapy-0.2.7[${PYTHON_USEDEP}] )
	aussie_broadband? ( ~dev-python/pyaussiebb-0.0.15[${PYTHON_USEDEP}] )
	autarco? ( ~dev-python/autarco-3.1.0[${PYTHON_USEDEP}] )
	avea? ( ~dev-python/avea-1.5.1[${PYTHON_USEDEP}] )
	avion? ( ~dev-python/avion-0.10[${PYTHON_USEDEP}] )
	awair? ( ~dev-python/python-awair-0.2.4[${PYTHON_USEDEP}] )
	aws? ( ~dev-python/aiobotocore-2.13.1[${PYTHON_USEDEP}] ~dev-python/botocore-1.34.131[${PYTHON_USEDEP}] )
	axis? ( ~dev-python/axis-63[${PYTHON_USEDEP}] )
	azure_data_explorer? ( ~dev-python/azure-kusto-data-4.5.1[${PYTHON_USEDEP},aio] ~dev-python/azure-kusto-ingest-4.5.1[${PYTHON_USEDEP}] )
	azure_devops? ( ~dev-python/aioazuredevops-2.2.1[${PYTHON_USEDEP}] )
	azure_event_hub? ( ~dev-python/azure-eventhub-5.11.1[${PYTHON_USEDEP}] )
	azure_service_bus? ( ~dev-python/azure-servicebus-7.10.0[${PYTHON_USEDEP}] )
	baf? ( ~dev-python/aiobafi6-0.9.0[${PYTHON_USEDEP}] )
	baidu? ( ~dev-python/baidu-aip-1.6.6[${PYTHON_USEDEP}] )
	balboa? ( ~dev-python/pybalboa-1.0.2[${PYTHON_USEDEP}] )
	bang_olufsen? ( ~dev-python/mozart-api-4.1.1.116.0[${PYTHON_USEDEP}] )
	bbox? ( ~dev-python/pybbox-0.0.5_alpha0[${PYTHON_USEDEP}] )
	beewi_smartclim? ( ~dev-python/beewi-smartclim-0.0.10[${PYTHON_USEDEP}] )
	bitcoin? ( ~dev-python/blockchain-1.4.4[${PYTHON_USEDEP}] )
	bizkaibus? ( ~dev-python/bizkaibus-0.1.1[${PYTHON_USEDEP}] )
	blackbird? ( ~dev-python/pyblackbird-0.6[${PYTHON_USEDEP}] )
	blebox? ( ~dev-python/blebox-uniapi-2.5.0[${PYTHON_USEDEP}] )
	blink? ( ~dev-python/blinkpy-0.23.0[${PYTHON_USEDEP}] )
	blinksticklight? ( ~dev-python/BlinkStick-1.2.0[${PYTHON_USEDEP}] )
	blockchain? ( ~dev-python/python-blockchain-api-0.0.2[${PYTHON_USEDEP}] )
	blue_current? ( ~dev-python/bluecurrent-api-1.2.3[${PYTHON_USEDEP}] )
	bluemaestro? ( ~dev-python/bluemaestro-ble-0.2.3[${PYTHON_USEDEP}] )
	bluesound? ( ~dev-python/pyblu-1.0.4[${PYTHON_USEDEP}] )
	bluetooth? ( ~dev-python/bleak-0.22.3[${PYTHON_USEDEP}] ~dev-python/bleak-retry-connector-3.6.0[${PYTHON_USEDEP}] ~dev-python/bluetooth-adapters-0.20.2[${PYTHON_USEDEP}] ~dev-python/bluetooth-auto-recovery-1.4.2[${PYTHON_USEDEP}] ~dev-python/bluetooth-data-tools-1.20.0[${PYTHON_USEDEP}] ~dev-python/dbus-fast-2.24.3[${PYTHON_USEDEP}] ~dev-python/habluetooth-3.6.0[${PYTHON_USEDEP}] )
	bluetooth_tracker? ( ~dev-python/PyBluez-0.22[${PYTHON_USEDEP}] ~dev-python/bt-proximity-0.2.1[${PYTHON_USEDEP}] )
	bmw_connected_drive? ( ~dev-python/bimmer-connected-0.16.4[${PYTHON_USEDEP},china] )
	bond? ( ~dev-python/bond-async-0.2.1[${PYTHON_USEDEP}] )
	bosch_shc? ( ~dev-python/boschshcpy-0.2.91[${PYTHON_USEDEP}] )
	braviatv? ( ~dev-python/pybravia-0.3.4[${PYTHON_USEDEP}] )
	bring? ( ~dev-python/bring-api-0.9.1[${PYTHON_USEDEP}] )
	broadlink? ( ~dev-python/broadlink-0.19.0[${PYTHON_USEDEP}] )
	brother? ( ~dev-python/brother-4.3.1[${PYTHON_USEDEP}] )
	brottsplatskartan? ( ~dev-python/brottsplatskartan-1.0.5[${PYTHON_USEDEP}] )
	brunt? ( ~dev-python/brunt-1.2.0[${PYTHON_USEDEP}] )
	bryant_evolution? ( ~dev-python/evolutionhttp-0.0.18[${PYTHON_USEDEP}] )
	bsblan? ( ~dev-python/python-bsblan-0.6.4[${PYTHON_USEDEP}] )
	bt_home_hub_5? ( ~dev-python/bthomehub5-devicelist-0.1.1[${PYTHON_USEDEP}] )
	bt_smarthub? ( ~dev-python/btsmarthub-devicelist-0.2.3[${PYTHON_USEDEP}] )
	bthome? ( ~dev-python/bthome-ble-3.9.1[${PYTHON_USEDEP}] )
	buienradar? ( ~dev-python/buienradar-1.0.6[${PYTHON_USEDEP}] )
	caldav? ( ~dev-python/caldav-1.3.9[${PYTHON_USEDEP}] )
	cambridge_audio? ( ~dev-python/aiostreammagic-2.8.5[${PYTHON_USEDEP}] )
	camera? ( ~dev-python/PyTurboJPEG-1.7.5[${PYTHON_USEDEP}] )
	canary? ( ~dev-python/py-canary-0.5.4[${PYTHON_USEDEP}] )
	cast? ( ~dev-python/pychromecast-14.0.5[${PYTHON_USEDEP}] )
	ccm15? ( ~dev-python/py-ccm15-0.0.9[${PYTHON_USEDEP}] )
	chacon_dio? ( ~dev-python/dio-chacon-wifi-api-1.2.1[${PYTHON_USEDEP}] )
	channels? ( ~dev-python/pychannels-1.2.3[${PYTHON_USEDEP}] )
	cisco_ios? ( ~dev-python/pexpect-4.6.0[${PYTHON_USEDEP}] )
	cisco_mobility_express? ( ~dev-python/ciscomobilityexpress-0.3.9[${PYTHON_USEDEP}] )
	cisco_webex_teams? ( ~dev-python/webexpythonsdk-2.0.1[${PYTHON_USEDEP}] )
	clementine? ( ~dev-python/python-clementine-remote-1.0.1[${PYTHON_USEDEP}] )
	cli? ( app-misc/home-assistant-cli[${PYTHON_USEDEP}] )
	cloud? ( ~dev-python/hass-nabucasa-0.83.0[${PYTHON_USEDEP}] )
	cloudflare? ( ~dev-python/pycfdns-3.0.0[${PYTHON_USEDEP}] )
	cmus? ( ~dev-python/pycmus-0.1.1[${PYTHON_USEDEP}] )
	co2signal? ( ~dev-python/aioelectricitymaps-0.4.0[${PYTHON_USEDEP}] )
	coinbase? ( ~dev-python/coinbase-2.1.0[${PYTHON_USEDEP}] ~dev-python/coinbase-advanced-py-1.2.2[${PYTHON_USEDEP}] )
	color_extractor? ( ~dev-python/colorthief-0.2.1[${PYTHON_USEDEP}] )
	comelit? ( ~dev-python/aiocomelit-0.9.1[${PYTHON_USEDEP}] )
	comfoconnect? ( ~dev-python/pycomfoconnect-0.5.1[${PYTHON_USEDEP}] )
	command_line? ( ~dev-python/jsonpath-0.82.2[${PYTHON_USEDEP}] )
	compensation? ( ~dev-python/numpy-1.26.4[${PYTHON_USEDEP}] )
	concord232? ( ~dev-python/concord232-0.15.1[${PYTHON_USEDEP}] )
	control4? ( ~dev-python/pyControl4-1.2.0[${PYTHON_USEDEP}] )
	conversation? ( ~dev-python/hassil-1.7.4[${PYTHON_USEDEP}] ~dev-python/home-assistant-intents-2024.11.6[${PYTHON_USEDEP}] )
	coolmaster? ( ~dev-python/pycoolmasternet-async-0.2.2[${PYTHON_USEDEP}] )
	cppm_tracker? ( ~dev-python/clearpasspy-1.0.2[${PYTHON_USEDEP}] )
	cpuspeed? ( ~dev-python/py-cpuinfo-9.0.0[${PYTHON_USEDEP}] )
	crownstone? ( ~dev-python/crownstone-cloud-1.4.11[${PYTHON_USEDEP}] ~dev-python/crownstone-sse-2.0.5[${PYTHON_USEDEP}] ~dev-python/crownstone-uart-2.1.0[${PYTHON_USEDEP}] ~dev-python/pyserial-3.5[${PYTHON_USEDEP}] )
	cups? ( ~dev-python/pycups-1.9.73[${PYTHON_USEDEP}] )
	daikin? ( ~dev-python/pydaikin-2.13.7[${PYTHON_USEDEP}] )
	danfoss_air? ( ~dev-python/pydanfossair-0.1.0[${PYTHON_USEDEP}] )
	datadog? ( ~dev-python/datadog-0.15.0[${PYTHON_USEDEP}] )
	deako? ( ~dev-python/pydeako-0.5.4[${PYTHON_USEDEP}] )
	debugpy? ( ~dev-python/debugpy-1.8.6[${PYTHON_USEDEP}] )
	deconz? ( ~dev-python/pydeconz-118[${PYTHON_USEDEP}] )
	decora? ( ~dev-python/bluepy-1.3.0[${PYTHON_USEDEP}] ~dev-python/decora-0.6[${PYTHON_USEDEP}] )
	decora_wifi? ( ~dev-python/decora-wifi-1.4[${PYTHON_USEDEP}] )
	delijn? ( ~dev-python/pydelijn-1.1.0[${PYTHON_USEDEP}] )
	deluge? ( ~dev-python/deluge-client-1.10.2[${PYTHON_USEDEP}] )
	denonavr? ( ~dev-python/denonavr-1.0.0[${PYTHON_USEDEP}] )
	devialet? ( ~dev-python/devialet-1.4.5[${PYTHON_USEDEP}] )
	devolo_home_control? ( ~dev-python/devolo-home-control-api-0.18.3[${PYTHON_USEDEP}] )
	devolo_home_network? ( ~dev-python/devolo-plc-api-1.4.1[${PYTHON_USEDEP}] )
	dexcom? ( ~dev-python/pydexcom-0.2.3[${PYTHON_USEDEP}] )
	dhcp? ( ~dev-python/aiodhcpwatcher-1.0.2[${PYTHON_USEDEP}] ~dev-python/aiodiscover-2.1.0[${PYTHON_USEDEP}] ~dev-python/cached-ipaddress-0.8.0[${PYTHON_USEDEP}] )
	digital_ocean? ( ~dev-python/python-digitalocean-1.13.2[${PYTHON_USEDEP}] )
	directv? ( ~dev-python/directv-0.4.0[${PYTHON_USEDEP}] )
	discogs? ( ~dev-python/discogs-client-2.3.0[${PYTHON_USEDEP}] )
	discord? ( ~dev-python/nextcord-2.6.0[${PYTHON_USEDEP}] )
	discovergy? ( ~dev-python/pydiscovergy-3.0.2[${PYTHON_USEDEP}] )
	dlib_face_detect? ( ~dev-python/face-recognition-1.2.3[${PYTHON_USEDEP}] )
	dlib_face_identify? ( ~dev-python/face-recognition-1.2.3[${PYTHON_USEDEP}] )
	dlink? ( ~dev-python/pyW215-0.7.0[${PYTHON_USEDEP}] )
	dlna_dmr? ( ~dev-python/async-upnp-client-0.41.0[${PYTHON_USEDEP}] ~dev-python/getmac-0.9.4[${PYTHON_USEDEP}] )
	dlna_dms? ( ~dev-python/async-upnp-client-0.41.0[${PYTHON_USEDEP}] )
	dnsip? ( ~dev-python/aiodns-3.2.0[${PYTHON_USEDEP}] )
	dominos? ( ~dev-python/pizzapi-0.0.6[${PYTHON_USEDEP}] )
	doods? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] ~dev-python/pydoods-1.0.2[${PYTHON_USEDEP}] )
	doorbird? ( ~dev-python/DoorBirdPy-3.0.8[${PYTHON_USEDEP}] )
	dormakaba_dkey? ( ~dev-python/py-dormakaba-dkey-1.0.5[${PYTHON_USEDEP}] )
	dovado? ( ~dev-python/dovado-0.4.1[${PYTHON_USEDEP}] )
	dremel_3d_printer? ( ~dev-python/dremel3dpy-2.1.1[${PYTHON_USEDEP}] )
	drop_connect? ( ~dev-python/dropmqttapi-1.0.3[${PYTHON_USEDEP}] )
	dsmr? ( ~dev-python/dsmr-parser-1.4.2[${PYTHON_USEDEP}] )
	duke_energy? ( ~dev-python/aiodukeenergy-0.2.2[${PYTHON_USEDEP}] )
	dunehd? ( ~dev-python/pdunehd-1.3.2[${PYTHON_USEDEP}] )
	duotecno? ( ~dev-python/pyDuotecno-2024.10.1[${PYTHON_USEDEP}] )
	dwd_weather_warnings? ( ~dev-python/dwdwfsapi-1.0.7[${PYTHON_USEDEP}] )
	dweet? ( ~dev-python/dweepy-0.3.0[${PYTHON_USEDEP}] )
	dynalite? ( ~dev-python/dynalite-devices-0.1.47[${PYTHON_USEDEP}] ~dev-python/dynalite-panel-0.0.4[${PYTHON_USEDEP}] )
	eafm? ( ~dev-python/aioeafm-0.1.2[${PYTHON_USEDEP}] )
	easyenergy? ( ~dev-python/easyenergy-2.1.2[${PYTHON_USEDEP}] )
	ebox? ( ~dev-python/pyebox-1.1.4[${PYTHON_USEDEP}] )
	ebusd? ( ~dev-python/ebusdpy-0.0.17[${PYTHON_USEDEP}] )
	ecoal_boiler? ( ~dev-python/ecoaliface-0.4.0[${PYTHON_USEDEP}] )
	ecobee? ( ~dev-python/python-ecobee-api-0.2.20[${PYTHON_USEDEP}] )
	ecoforest? ( ~dev-python/pyecoforest-0.4.0[${PYTHON_USEDEP}] )
	econet? ( ~dev-python/pyeconet-0.1.23[${PYTHON_USEDEP}] )
	ecovacs? ( ~dev-python/deebot-client-8.4.0[${PYTHON_USEDEP}] ~dev-python/py-sucks-0.9.10[${PYTHON_USEDEP}] )
	ecowitt? ( ~dev-python/aioecowitt-2024.2.1[${PYTHON_USEDEP}] )
	eddystone_temperature? ( ~dev-python/beacontools-2.1.0[${PYTHON_USEDEP},scan] )
	edimax? ( ~dev-python/pyedimax-0.2.1[${PYTHON_USEDEP}] )
	edl21? ( ~dev-python/pysml-0.0.12[${PYTHON_USEDEP}] )
	efergy? ( ~dev-python/pyefergy-22.5.0[${PYTHON_USEDEP}] )
	egardia? ( ~dev-python/pythonegardia-1.0.52[${PYTHON_USEDEP}] )
	electrasmart? ( ~dev-python/pyElectra-1.2.4[${PYTHON_USEDEP}] )
	electric_kiwi? ( ~dev-python/electrickiwi-api-0.8.5[${PYTHON_USEDEP}] )
	elevenlabs? ( ~dev-python/elevenlabs-1.6.1[${PYTHON_USEDEP}] )
	elgato? ( ~dev-python/elgato-5.1.2[${PYTHON_USEDEP}] )
	eliqonline? ( ~dev-python/eliqonline-1.2.2[${PYTHON_USEDEP}] )
	elkm1? ( ~dev-python/elkm1-lib-2.2.10[${PYTHON_USEDEP}] )
	elmax? ( ~dev-python/elmax-api-0.0.6.1[${PYTHON_USEDEP}] )
	elv? ( ~dev-python/pypca-0.0.7[${PYTHON_USEDEP}] )
	elvia? ( ~dev-python/elvia-0.1.0[${PYTHON_USEDEP}] )
	emby? ( ~dev-python/pyEmby-1.10[${PYTHON_USEDEP}] )
	emoncms? ( ~dev-python/pyemoncms-0.1.1[${PYTHON_USEDEP}] )
	emonitor? ( ~dev-python/aioemonitor-1.0.5[${PYTHON_USEDEP}] )
	emulated_kasa? ( ~dev-python/sense-energy-0.13.4[${PYTHON_USEDEP}] )
	emulated_roku? ( ~dev-python/emulated-roku-0.3.0[${PYTHON_USEDEP}] )
	energenie_power_sockets? ( ~dev-python/pyegps-0.2.5[${PYTHON_USEDEP}] )
	energyzero? ( ~dev-python/energyzero-2.1.1[${PYTHON_USEDEP}] )
	enigma2? ( ~dev-python/openwebifpy-4.2.7[${PYTHON_USEDEP}] )
	enocean? ( ~dev-python/enocean-0.50[${PYTHON_USEDEP}] )
	enphase_envoy? ( ~dev-python/pyenphase-1.22.0[${PYTHON_USEDEP}] )
	entur_public_transport? ( ~dev-python/enturclient-0.2.4[${PYTHON_USEDEP}] )
	environment_canada? ( ~dev-python/env-canada-0.7.2[${PYTHON_USEDEP}] )
	envisalink? ( ~dev-python/pyenvisalink-4.7[${PYTHON_USEDEP}] )
	ephember? ( ~dev-python/pyephember-0.3.1[${PYTHON_USEDEP}] )
	epic_games_store? ( ~dev-python/epicstore-api-0.1.7[${PYTHON_USEDEP}] )
	epion? ( ~dev-python/epion-0.0.3[${PYTHON_USEDEP}] )
	epson? ( ~dev-python/epson-projector-0.5.1[${PYTHON_USEDEP}] )
	eq3btsmart? ( ~dev-python/bleak-esphome-1.1.0[${PYTHON_USEDEP}] ~dev-python/eq3btsmart-1.2.0[${PYTHON_USEDEP}] )
	escea? ( ~dev-python/pescea-1.0.12[${PYTHON_USEDEP}] )
	esphome? ( ~dev-python/aioesphomeapi-27.0.1[${PYTHON_USEDEP}] ~dev-python/bleak-esphome-1.1.0[${PYTHON_USEDEP}] ~dev-python/esphome-dashboard-api-1.2.3[${PYTHON_USEDEP}] )
	etherscan? ( ~dev-python/python-etherscan-api-0.0.3[${PYTHON_USEDEP}] )
	eufy? ( ~dev-python/lakeside-0.13[${PYTHON_USEDEP}] )
	eufylife_ble? ( ~dev-python/eufylife-ble-client-0.1.8[${PYTHON_USEDEP}] )
	everlights? ( ~dev-python/pyeverlights-0.1.0[${PYTHON_USEDEP}] )
	evil_genius_labs? ( ~dev-python/pyevilgenius-2.0.0[${PYTHON_USEDEP}] )
	evohome? ( ~dev-python/evohome-async-0.4.20[${PYTHON_USEDEP}] )
	ezviz? ( ~dev-python/pyezviz-0.2.1.2[${PYTHON_USEDEP}] )
	faa_delays? ( ~dev-python/faadelays-2023.9.1[${PYTHON_USEDEP}] )
	familyhub? ( ~dev-python/python-family-hub-local-0.0.2[${PYTHON_USEDEP}] )
	fastdotcom? ( ~dev-python/fastdotcom-0.0.3[${PYTHON_USEDEP}] )
	feedreader? ( ~dev-python/feedparser-6.0.11[${PYTHON_USEDEP}] )
	ffmpeg? ( ~dev-python/ha-ffmpeg-3.2.2[${PYTHON_USEDEP}] )
	fibaro? ( ~dev-python/pyfibaro-0.8.0[${PYTHON_USEDEP}] )
	fido? ( ~dev-python/pyfido-2.1.2[${PYTHON_USEDEP}] )
	file? ( ~dev-python/file-read-backwards-2.0.0[${PYTHON_USEDEP}] )
	fints? ( ~dev-python/fints-3.1.0[${PYTHON_USEDEP}] )
	fireservicerota? ( ~dev-python/pyfireservicerota-0.0.43[${PYTHON_USEDEP}] )
	firmata? ( ~dev-python/pymata-express-1.19[${PYTHON_USEDEP}] )
	fitbit? ( ~dev-python/fitbit-0.3.1[${PYTHON_USEDEP}] )
	fivem? ( ~dev-python/fivem-api-0.1.2[${PYTHON_USEDEP}] )
	fixer? ( ~dev-python/fixerio-1.0.0_alpha0[${PYTHON_USEDEP}] )
	fjaraskupan? ( ~dev-python/fjaraskupan-2.3.0[${PYTHON_USEDEP}] )
	fleetgo? ( ~dev-python/ritassist-0.9.2[${PYTHON_USEDEP}] )
	flexit_bacnet? ( ~dev-python/flexit-bacnet-2.2.1[${PYTHON_USEDEP}] )
	flic? ( ~dev-python/pyflic-2.0.4[${PYTHON_USEDEP}] )
	flick_electric? ( ~dev-python/PyFlick-0.0.2[${PYTHON_USEDEP}] )
	flipr? ( ~dev-python/flipr-api-1.6.1[${PYTHON_USEDEP}] )
	flo? ( ~dev-python/aioflo-2021.11.0[${PYTHON_USEDEP}] )
	flume? ( ~dev-python/PyFlume-0.6.5[${PYTHON_USEDEP}] )
	flux_led? ( ~dev-python/flux-led-1.0.4[${PYTHON_USEDEP}] )
	folder_watcher? ( ~dev-python/watchdog-2.3.1[${PYTHON_USEDEP}] )
	foobot? ( ~dev-python/foobot_async-1.0.0[${PYTHON_USEDEP}] )
	forecast_solar? ( ~dev-python/forecast-solar-3.1.0[${PYTHON_USEDEP}] )
	forked_daapd? ( ~dev-python/pyforked-daapd-0.1.14[${PYTHON_USEDEP}] ~dev-python/pylibrespot-java-0.1.1[${PYTHON_USEDEP}] )
	fortios? ( ~dev-python/fortiosapi-1.0.5[${PYTHON_USEDEP}] )
	foscam? ( ~dev-python/libpyfoscam-1.2.2[${PYTHON_USEDEP}] )
	free_mobile? ( ~dev-python/freesms-0.2.0[${PYTHON_USEDEP}] )
	freebox? ( ~dev-python/freebox-api-1.1.0[${PYTHON_USEDEP}] )
	freedompro? ( ~dev-python/pyfreedompro-1.1.0[${PYTHON_USEDEP}] )
	fritz? ( ~dev-python/fritzconnection-1.14.0[${PYTHON_USEDEP},qrcode] ~dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}] )
	fritzbox? ( ~dev-python/pyfritzhome-0.6.12[${PYTHON_USEDEP}] )
	fritzbox_callmonitor? ( ~dev-python/fritzconnection-1.14.0[${PYTHON_USEDEP},qrcode] )
	fronius? ( ~dev-python/PyFronius-0.7.3[${PYTHON_USEDEP}] )
	frontier_silicon? ( ~dev-python/afsapi-0.2.7[${PYTHON_USEDEP}] )
	fujitsu_fglair? ( ~dev-python/ayla-iot-unofficial-1.4.3[${PYTHON_USEDEP}] )
	fully_kiosk? ( ~dev-python/python-fullykiosk-0.0.14[${PYTHON_USEDEP}] )
	futurenow? ( ~dev-python/pyfnip-0.2[${PYTHON_USEDEP}] )
	fyta? ( ~dev-python/fyta-cli-0.6.10[${PYTHON_USEDEP}] )
	garages_amsterdam? ( ~dev-python/odp-amsterdam-6.0.2[${PYTHON_USEDEP}] )
	gardena_bluetooth? ( ~dev-python/gardena-bluetooth-1.4.4[${PYTHON_USEDEP}] )
	gc100? ( ~dev-python/python-gc100-1.0.3_alpha0[${PYTHON_USEDEP}] )
	gdacs? ( ~dev-python/aio-georss-gdacs-0.10[${PYTHON_USEDEP}] )
	generic? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] ~dev-python/ha-av-10.1.1[${PYTHON_USEDEP}] )
	geniushub? ( ~dev-python/geniushub-client-0.7.1[${PYTHON_USEDEP}] )
	geo_json_events? ( ~dev-python/aio-geojson-generic-client-0.4[${PYTHON_USEDEP}] )
	geo_rss_events? ( ~dev-python/georss-generic-client-0.8[${PYTHON_USEDEP}] )
	geocaching? ( ~dev-python/geocachingapi-0.2.1[${PYTHON_USEDEP}] )
	geonetnz_quakes? ( ~dev-python/aio-geojson-geonetnz-quakes-0.16[${PYTHON_USEDEP}] )
	geonetnz_volcano? ( ~dev-python/aio-geojson-geonetnz-volcano-0.9[${PYTHON_USEDEP}] )
	gios? ( ~dev-python/gios-5.0.0[${PYTHON_USEDEP}] )
	github? ( ~dev-python/aiogithubapi-24.6.0[${PYTHON_USEDEP}] )
	gitlab_ci? ( ~dev-vcs/python-gitlab-1.6.0[${PYTHON_USEDEP}] )
	gitter? ( ~dev-python/gitterpy-0.1.7[${PYTHON_USEDEP}] )
	glances? ( ~dev-python/glances-api-0.8.0[${PYTHON_USEDEP}] )
	go2rtc? ( ~dev-python/go2rtc-client-0.1.1[${PYTHON_USEDEP}] )
	goalzero? ( ~dev-python/goalzero-0.2.2[${PYTHON_USEDEP}] )
	gogogate2? ( ~dev-python/ismartgate-5.0.1[${PYTHON_USEDEP}] )
	goodwe? ( ~dev-python/goodwe-0.3.6[${PYTHON_USEDEP}] )
	google? ( ~dev-python/gcal-sync-6.2.0[${PYTHON_USEDEP}] ~dev-python/ical-8.2.0[${PYTHON_USEDEP}] ~dev-python/oauth2client-4.1.3[${PYTHON_USEDEP}] )
	google_assistant_sdk? ( ~dev-python/gassist-text-0.0.11[${PYTHON_USEDEP}] )
	google_cloud? ( ~dev-python/google-cloud-speech-2.27.0[${PYTHON_USEDEP}] ~dev-python/google-cloud-texttospeech-2.17.2[${PYTHON_USEDEP}] )
	google_generative_ai_conversation? ( ~dev-python/google-generativeai-0.8.2[${PYTHON_USEDEP}] )
	google_mail? ( ~dev-python/google-api-python-client-2.71.0[${PYTHON_USEDEP}] )
	google_maps? ( ~dev-python/locationsharinglib-5.0.1[${PYTHON_USEDEP}] )
	google_photos? ( ~dev-python/google-photos-library-api-0.12.1[${PYTHON_USEDEP}] )
	google_pubsub? ( ~dev-python/google-cloud-pubsub-2.23.0[${PYTHON_USEDEP}] )
	google_sheets? ( ~dev-python/gspread-5.5.0[${PYTHON_USEDEP}] )
	google_tasks? ( ~dev-python/google-api-python-client-2.71.0[${PYTHON_USEDEP}] )
	google_translate? ( ~dev-python/gTTS-2.2.4[${PYTHON_USEDEP}] )
	google_travel_time? ( ~dev-python/googlemaps-2.5.1[${PYTHON_USEDEP}] )
	govee_ble? ( ~dev-python/govee-ble-0.40.0[${PYTHON_USEDEP}] )
	govee_light_local? ( ~dev-python/govee-local-api-1.5.3[${PYTHON_USEDEP}] )
	gpsd? ( ~dev-python/gps3-0.33.3[${PYTHON_USEDEP}] )
	gree? ( ~dev-python/greeclimate-2.1.0[${PYTHON_USEDEP}] )
	greeneye_monitor? ( ~dev-python/greeneye-monitor-3.0.3[${PYTHON_USEDEP}] )
	greenwave? ( ~dev-python/greenwavereality-0.5.1[${PYTHON_USEDEP}] )
	growatt_server? ( ~dev-python/growattServer-1.5.0[${PYTHON_USEDEP}] )
	gstreamer? ( ~dev-python/gstreamer-player-1.1.2[${PYTHON_USEDEP}] )
	gtfs? ( ~dev-python/pygtfs-0.1.9[${PYTHON_USEDEP}] )
	guardian? ( ~dev-python/aioguardian-2022.7.0[${PYTHON_USEDEP}] )
	habitica? ( ~dev-python/habitipy-0.3.3[${PYTHON_USEDEP}] )
	harman_kardon_avr? ( ~dev-python/hkavr-0.0.5[${PYTHON_USEDEP}] )
	harmony? ( ~dev-python/aioharmony-0.2.10[${PYTHON_USEDEP}] )
	hassio? ( ~dev-python/aiohasupervisor-0.2.1[${PYTHON_USEDEP}] )
	hdmi_cec? ( ~dev-python/pyCEC-0.5.2[${PYTHON_USEDEP}] )
	heatmiser? ( ~dev-python/heatmiserV3-2.0.3[${PYTHON_USEDEP}] )
	heos? ( ~dev-python/pyheos-0.7.2[${PYTHON_USEDEP}] )
	here_travel_time? ( ~dev-python/here-routing-1.0.1[${PYTHON_USEDEP}] ~dev-python/here-transit-1.2.1[${PYTHON_USEDEP}] )
	hikvision? ( ~dev-python/pyHik-0.3.2[${PYTHON_USEDEP}] )
	hikvisioncam? ( ~dev-python/hikvision-0.4[${PYTHON_USEDEP}] )
	hisense_aehw4a1? ( ~dev-python/pyaehw4a1-0.3.9[${PYTHON_USEDEP}] )
	hive? ( ~dev-python/pyhiveapi-0.5.16[${PYTHON_USEDEP}] )
	hko? ( ~dev-python/hko-0.3.2[${PYTHON_USEDEP}] )
	hlk_sw16? ( ~dev-python/hlk-sw16-0.0.9[${PYTHON_USEDEP}] )
	holiday? ( ~dev-python/babel-2.15.0[${PYTHON_USEDEP}] ~dev-python/holidays-0.61[${PYTHON_USEDEP}] )
	home_connect? ( ~dev-python/homeconnect-0.8.0[${PYTHON_USEDEP}] )
	homekit? ( ~dev-python/HAP-python-4.9.2[${PYTHON_USEDEP}] ~dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}] ~dev-python/base36-0.1.1[${PYTHON_USEDEP}] ~dev-python/fnv-hash-fast-1.0.2[${PYTHON_USEDEP}] )
	homekit_controller? ( ~dev-python/aiohomekit-3.2.6[${PYTHON_USEDEP}] )
	homematic? ( ~dev-python/pyhomematic-0.1.77[${PYTHON_USEDEP}] )
	homematicip_cloud? ( ~dev-python/homematicip-1.1.3[${PYTHON_USEDEP}] )
	homewizard? ( ~dev-python/python-homewizard-energy-6.3.0[${PYTHON_USEDEP}] )
	homeworks? ( ~dev-python/pyhomeworks-1.1.2[${PYTHON_USEDEP}] )
	honeywell? ( ~dev-python/AIOSomecomfort-0.0.25[${PYTHON_USEDEP}] )
	horizon? ( ~dev-python/horimote-0.4.1[${PYTHON_USEDEP}] )
	hp_ilo? ( ~dev-python/python-hpilo-4.4.3[${PYTHON_USEDEP}] )
	html5? ( ~dev-python/pywebpush-1.14.1[${PYTHON_USEDEP}] )
	huawei_lte? ( ~dev-python/huawei-lte-api-1.9.3[${PYTHON_USEDEP}] ~dev-python/stringcase-1.2.0[${PYTHON_USEDEP}] ~dev-python/url-normalize-1.4.3[${PYTHON_USEDEP}] )
	hue? ( ~dev-python/aiohue-4.7.3[${PYTHON_USEDEP}] )
	huisbaasje? ( ~dev-python/energyflip-client-0.2.2[${PYTHON_USEDEP}] )
	hunterdouglas_powerview? ( ~dev-python/aiopvapi-3.1.1[${PYTHON_USEDEP}] )
	husqvarna_automower? ( ~dev-python/aioautomower-2024.10.3[${PYTHON_USEDEP}] )
	husqvarna_automower_ble? ( ~dev-python/automower-ble-0.2.0[${PYTHON_USEDEP}] )
	huum? ( ~dev-python/huum-0.7.10[${PYTHON_USEDEP}] )
	hvv_departures? ( ~dev-python/pygti-0.9.4[${PYTHON_USEDEP}] )
	hydrawise? ( ~dev-python/pydrawise-2024.9.0[${PYTHON_USEDEP}] )
	hyperion? ( ~dev-python/hyperion-py-0.7.5[${PYTHON_USEDEP}] )
	ialarm? ( ~dev-python/pyialarm-2.2.0[${PYTHON_USEDEP}] )
	iammeter? ( ~dev-python/iammeter-0.2.1[${PYTHON_USEDEP}] )
	iaqualink? ( ~dev-python/h2-4.1.0[${PYTHON_USEDEP}] ~dev-python/iaqualink-0.5.0[${PYTHON_USEDEP}] )
	ibeacon? ( ~dev-python/ibeacon-ble-1.2.0[${PYTHON_USEDEP}] )
	icloud? ( ~dev-python/pyicloud-1.0.0[${PYTHON_USEDEP}] )
	idasen_desk? ( ~dev-python/idasen-ha-2.6.2[${PYTHON_USEDEP}] )
	idteck_prox? ( ~dev-python/rfk101py-0.0.1[${PYTHON_USEDEP}] )
	ifttt? ( ~dev-python/pyfttt-0.3[${PYTHON_USEDEP}] )
	iglo? ( ~dev-python/iglo-1.2.7[${PYTHON_USEDEP}] )
	ign_sismologia? ( ~dev-python/georss-ign-sismologia-client-0.8[${PYTHON_USEDEP}] )
	ihc? ( ~dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}] ~dev-python/ihcsdk-2.8.5[${PYTHON_USEDEP}] )
	imap? ( ~dev-python/aioimaplib-1.1.0[${PYTHON_USEDEP}] )
	imgw_pib? ( ~dev-python/imgw-pib-1.0.6[${PYTHON_USEDEP}] )
	improv_ble? ( ~dev-python/py-improv-ble-client-1.0.3[${PYTHON_USEDEP}] )
	incomfort? ( ~dev-python/incomfort-client-0.6.3_p1[${PYTHON_USEDEP}] )
	influxdb? ( ~dev-python/influxdb-5.3.1[${PYTHON_USEDEP}] ~dev-python/influxdb-client-1.24.0[${PYTHON_USEDEP}] )
	inkbird? ( ~dev-python/inkbird-ble-0.5.8[${PYTHON_USEDEP}] )
	insteon? ( ~dev-python/insteon-frontend-home-assistant-0.5.0[${PYTHON_USEDEP}] ~dev-python/pyinsteon-1.6.3[${PYTHON_USEDEP}] )
	intellifire? ( ~dev-python/intellifire4py-4.1.9[${PYTHON_USEDEP}] )
	intesishome? ( ~dev-python/pyintesishome-1.8.0[${PYTHON_USEDEP}] )
	iotawatt? ( ~dev-python/ha-iotawattpy-0.1.2[${PYTHON_USEDEP}] )
	iotty? ( ~dev-python/iottycloud-0.2.1[${PYTHON_USEDEP}] )
	iperf3? ( ~dev-python/iperf3-0.1.11[${PYTHON_USEDEP}] )
	ipma? ( ~dev-python/pyipma-3.0.7[${PYTHON_USEDEP}] )
	ipp? ( ~dev-python/pyipp-0.17.0[${PYTHON_USEDEP}] )
	iqvia? ( ~dev-python/numpy-1.26.4[${PYTHON_USEDEP}] ~dev-python/pyiqvia-2022.4.0[${PYTHON_USEDEP}] )
	irish_rail_transport? ( ~dev-python/pyirishrail-0.0.2[${PYTHON_USEDEP}] )
	iron_os? ( ~dev-python/aiogithubapi-24.6.0[${PYTHON_USEDEP}] ~dev-python/pynecil-0.2.0[${PYTHON_USEDEP}] )
	isal? ( ~dev-python/isal-1.7.1[${PYTHON_USEDEP}] )
	iskra? ( ~dev-python/pyiskra-0.1.14[${PYTHON_USEDEP}] )
	islamic_prayer_times? ( ~dev-python/prayer-times-calculator-offline-1.0.3[${PYTHON_USEDEP}] )
	israel_rail? ( ~dev-python/israel-rail-api-0.1.2[${PYTHON_USEDEP}] )
	iss? ( ~dev-python/pyiss-1.0.1[${PYTHON_USEDEP}] )
	ista_ecotrend? ( ~dev-python/pyecotrend-ista-3.3.1[${PYTHON_USEDEP}] )
	isy994? ( ~dev-python/pyisy-3.1.14[${PYTHON_USEDEP}] )
	itach? ( ~dev-python/pyitachip2ir-0.0.7[${PYTHON_USEDEP}] )
	izone? ( ~dev-python/python-izone-1.2.9[${PYTHON_USEDEP}] )
	jellyfin? ( ~dev-python/jellyfin-apiclient-python-1.9.2[${PYTHON_USEDEP}] )
	jewish_calendar? ( ~dev-python/hdate-0.10.9[${PYTHON_USEDEP}] )
	joaoapps_join? ( ~dev-python/python-join-api-0.0.9[${PYTHON_USEDEP}] )
	juicenet? ( ~dev-python/python-juicenet-1.1.0[${PYTHON_USEDEP}] )
	justnimbus? ( ~dev-python/justnimbus-0.7.4[${PYTHON_USEDEP}] )
	jvc_projector? ( ~dev-python/pyjvcprojector-1.1.2[${PYTHON_USEDEP}] )
	kaiterra? ( ~dev-python/kaiterra-async-client-1.0.0[${PYTHON_USEDEP}] )
	kaleidescape? ( ~dev-python/pykaleidescape-1.0.1[${PYTHON_USEDEP}] )
	keba? ( ~dev-python/keba-kecontact-1.1.0[${PYTHON_USEDEP}] )
	keenetic_ndms2? ( ~dev-python/ndms2-client-0.1.2[${PYTHON_USEDEP}] )
	kef? ( ~dev-python/aiokef-0.2.16[${PYTHON_USEDEP}] ~dev-python/getmac-0.9.4[${PYTHON_USEDEP}] )
	kegtron? ( ~dev-python/kegtron-ble-0.4.0[${PYTHON_USEDEP}] )
	keyboard? ( ~dev-python/pyuserinput-0.1.11[${PYTHON_USEDEP}] )
	keyboard_remote? ( ~dev-python/asyncinotify-4.0.2[${PYTHON_USEDEP}] ~dev-python/evdev-1.6.1[${PYTHON_USEDEP}] )
	keymitt_ble? ( ~dev-python/PyMicroBot-0.0.17[${PYTHON_USEDEP}] )
	kira? ( ~dev-python/pykira-0.1.1[${PYTHON_USEDEP}] )
	kiwi? ( ~dev-python/kiwiki-client-0.1.1[${PYTHON_USEDEP}] )
	kmtronic? ( ~dev-python/pykmtronic-0.3.0[${PYTHON_USEDEP}] )
	knocki? ( ~dev-python/knocki-0.3.5[${PYTHON_USEDEP}] )
	knx? ( ~dev-python/knx-frontend-2024.9.10.221729[${PYTHON_USEDEP}] ~dev-python/xknx-3.3.0[${PYTHON_USEDEP}] ~dev-python/xknxproject-3.8.1[${PYTHON_USEDEP}] )
	kodi? ( ~dev-python/pykodi-0.2.7[${PYTHON_USEDEP}] )
	konnected? ( ~dev-python/konnected-1.2.0[${PYTHON_USEDEP}] )
	kostal_plenticore? ( ~dev-python/pykoplenti-1.2.2[${PYTHON_USEDEP}] )
	kraken? ( ~dev-python/krakenex-2.2.2[${PYTHON_USEDEP}] ~dev-python/pykrakenapi-0.1.8[${PYTHON_USEDEP}] )
	kulersky? ( ~dev-python/pykulersky-0.5.2[${PYTHON_USEDEP}] )
	kwb? ( ~dev-python/pykwb-0.0.8[${PYTHON_USEDEP}] )
	lacrosse? ( ~dev-python/pylacrosse-0.4[${PYTHON_USEDEP}] )
	lacrosse_view? ( ~dev-python/lacrosse-view-1.0.3[${PYTHON_USEDEP}] )
	lamarzocco? ( ~dev-python/lmcloud-1.2.3[${PYTHON_USEDEP}] )
	lametric? ( ~dev-python/demetriek-0.4.0[${PYTHON_USEDEP}] )
	landisgyr_heat_meter? ( ~dev-python/ultraheat-api-0.5.7[${PYTHON_USEDEP}] )
	lastfm? ( ~dev-python/pylast-5.1.0[${PYTHON_USEDEP}] )
	launch_library? ( ~dev-python/pylaunches-2.0.0[${PYTHON_USEDEP}] )
	laundrify? ( ~dev-python/laundrify-aio-1.2.2[${PYTHON_USEDEP}] )
	lcn? ( ~dev-python/lcn-frontend-0.2.1[${PYTHON_USEDEP}] ~dev-python/pypck-0.7.24[${PYTHON_USEDEP}] )
	ld2410_ble? ( ~dev-python/bluetooth-data-tools-1.20.0[${PYTHON_USEDEP}] ~dev-python/ld2410-ble-0.1.1[${PYTHON_USEDEP}] )
	leaone? ( ~dev-python/leaone-ble-0.1.0[${PYTHON_USEDEP}] )
	led_ble? ( ~dev-python/bluetooth-data-tools-1.20.0[${PYTHON_USEDEP}] ~dev-python/led-ble-1.0.2[${PYTHON_USEDEP}] )
	lektrico? ( ~dev-python/lektricowifi-0.0.43[${PYTHON_USEDEP}] )
	lg_netcast? ( ~dev-python/pylgnetcast-0.3.9[${PYTHON_USEDEP}] )
	lg_soundbar? ( ~dev-python/temescal-0.5[${PYTHON_USEDEP}] )
	lg_thinq? ( ~dev-python/thinqconnect-1.0.0[${PYTHON_USEDEP}] )
	lidarr? ( ~dev-python/aiopyarr-23.4.0[${PYTHON_USEDEP}] )
	lifx? ( ~dev-python/aiolifx-1.1.1[${PYTHON_USEDEP}] ~dev-python/aiolifx-effects-0.3.2[${PYTHON_USEDEP}] ~dev-python/aiolifx-themes-0.5.5[${PYTHON_USEDEP}] )
	lightwave? ( ~dev-python/lightwave-0.24[${PYTHON_USEDEP}] )
	limitlessled? ( ~dev-python/limitlessled-1.1.3[${PYTHON_USEDEP}] )
	linear_garage_door? ( ~dev-python/linear-garage-door-0.2.9[${PYTHON_USEDEP}] )
	linkplay? ( ~dev-python/python-linkplay-0.0.20[${PYTHON_USEDEP}] )
	linode? ( ~dev-python/linode-api-4.1.9_beta1[${PYTHON_USEDEP}] )
	linux_battery? ( ~dev-python/batinfo-0.4.2[${PYTHON_USEDEP}] )
	lirc? ( ~dev-python/python-lirc-1.2.3[${PYTHON_USEDEP}] )
	litejet? ( ~dev-python/pylitejet-0.6.3[${PYTHON_USEDEP}] )
	litterrobot? ( ~dev-python/pylitterbot-2023.5.0[${PYTHON_USEDEP}] )
	livisi? ( ~dev-python/aiolivisi-0.0.19[${PYTHON_USEDEP}] )
	local_calendar? ( ~dev-python/ical-8.2.0[${PYTHON_USEDEP}] )
	local_todo? ( ~dev-python/ical-8.2.0[${PYTHON_USEDEP}] )
	london_underground? ( ~dev-python/london-tube-status-0.5[${PYTHON_USEDEP}] )
	lookin? ( ~dev-python/aiolookin-1.0.0[${PYTHON_USEDEP}] )
	loqed? ( ~dev-python/loqedAPI-2.1.10[${PYTHON_USEDEP}] )
	luci? ( ~dev-python/openwrt-luci-rpc-1.1.17[${PYTHON_USEDEP}] )
	luftdaten? ( ~dev-python/luftdaten-0.7.4[${PYTHON_USEDEP}] )
	lupusec? ( ~dev-python/lupupy-0.3.2[${PYTHON_USEDEP}] )
	lutron? ( ~dev-python/pylutron-0.2.16[${PYTHON_USEDEP}] )
	lutron_caseta? ( ~dev-python/pylutron-caseta-0.21.1[${PYTHON_USEDEP}] )
	lw12wifi? ( ~dev-python/lw12-0.9.2[${PYTHON_USEDEP}] )
	lyric? ( ~dev-python/aiolyric-2.0.1[${PYTHON_USEDEP}] )
	madvr? ( ~dev-python/py-madvr2-1.6.32[${PYTHON_USEDEP}] )
	mailgun? ( ~dev-python/pymailgunner-1.4[${PYTHON_USEDEP}] )
	marytts? ( ~dev-python/speak2mary-1.4.0[${PYTHON_USEDEP}] )
	mastodon? ( ~dev-python/Mastodon-py-1.8.1[${PYTHON_USEDEP}] )
	matrix? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] ~dev-python/matrix-nio-0.25.2[${PYTHON_USEDEP}] )
	matter? ( ~dev-python/python-matter-server-6.6.0[${PYTHON_USEDEP}] )
	maxcube? ( ~dev-python/maxcube-api-0.4.3[${PYTHON_USEDEP}] )
	mealie? ( ~dev-python/aiomealie-0.9.3[${PYTHON_USEDEP}] )
	meater? ( ~dev-python/meater-python-0.0.8[${PYTHON_USEDEP}] )
	medcom_ble? ( ~dev-python/medcom-ble-0.1.1[${PYTHON_USEDEP}] )
	media_extractor? ( ~net-misc/yt-dlp-2024.11.4[${PYTHON_USEDEP},default] )
	mediaroom? ( ~dev-python/pymediaroom-0.6.5.4[${PYTHON_USEDEP}] )
	melcloud? ( ~dev-python/pymelcloud-2.5.9[${PYTHON_USEDEP}] )
	melissa? ( ~dev-python/py-melissa-climate-2.1.4[${PYTHON_USEDEP}] )
	melnor? ( ~dev-python/melnor-bluetooth-0.0.25[${PYTHON_USEDEP}] )
	message_bird? ( ~dev-python/messagebird-1.2.0[${PYTHON_USEDEP}] )
	met? ( ~dev-python/PyMetno-0.13.0[${PYTHON_USEDEP}] )
	met_eireann? ( ~dev-python/PyMetEireann-2021.8.0[${PYTHON_USEDEP}] )
	meteo_france? ( ~dev-python/meteofrance-api-1.3.0[${PYTHON_USEDEP}] )
	meteoalarm? ( ~dev-python/meteoalertapi-0.3.1[${PYTHON_USEDEP}] )
	meteoclimatic? ( ~dev-python/pymeteoclimatic-0.1.0[${PYTHON_USEDEP}] )
	metoffice? ( ~dev-python/datapoint-0.9.9[${PYTHON_USEDEP}] )
	mfi? ( ~dev-python/mficlient-0.5.0[${PYTHON_USEDEP}] )
	microbees? ( ~dev-python/microBeesPy-0.3.2[${PYTHON_USEDEP}] )
	microsoft? ( ~dev-python/pycsspeechtts-1.0.8[${PYTHON_USEDEP}] )
	mikrotik? ( ~dev-python/librouteros-3.2.0[${PYTHON_USEDEP}] )
	mill? ( ~dev-python/mill-local-0.3.0[${PYTHON_USEDEP}] ~dev-python/millheater-0.11.8[${PYTHON_USEDEP}] )
	minecraft_server? ( ~dev-python/mcstatus-11.1.1[${PYTHON_USEDEP}] )
	minio? ( ~dev-python/minio-7.1.12[${PYTHON_USEDEP}] )
	moat? ( ~dev-python/moat-ble-0.1.1[${PYTHON_USEDEP}] )
	mobile_app? ( ~dev-python/pynacl-1.5.0[${PYTHON_USEDEP}] )
	mochad? ( ~dev-python/pymochad-0.2.0[${PYTHON_USEDEP}] )
	modbus? ( ~dev-python/pymodbus-3.6.9[${PYTHON_USEDEP}] )
	modem_callerid? ( ~dev-python/phone-modem-0.1.1[${PYTHON_USEDEP}] )
	modern_forms? ( ~dev-python/aiomodernforms-0.1.8[${PYTHON_USEDEP}] )
	moehlenhoff_alpha2? ( ~dev-python/moehlenhoff-alpha2-1.3.1[${PYTHON_USEDEP}] )
	monarch_money? ( ~dev-python/typedmonarchmoney-0.3.1[${PYTHON_USEDEP}] )
	monoprice? ( ~dev-python/pymonoprice-0.4[${PYTHON_USEDEP}] )
	monzo? ( ~dev-python/monzopy-1.3.2[${PYTHON_USEDEP}] )
	mopeka? ( ~dev-python/mopeka-iot-ble-0.8.0[${PYTHON_USEDEP}] )
	motion_blinds? ( ~dev-python/motionblinds-0.6.25[${PYTHON_USEDEP}] )
	motionblinds_ble? ( ~dev-python/motionblindsble-0.1.2[${PYTHON_USEDEP}] )
	motioneye? ( ~dev-python/motioneye-client-0.3.14[${PYTHON_USEDEP}] )
	motionmount? ( ~dev-python/python-MotionMount-2.2.0[${PYTHON_USEDEP}] )
	mpd? ( ~dev-python/python-mpd2-3.1.1[${PYTHON_USEDEP}] )
	mqtt? ( ~dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}] )
	msteams? ( ~dev-python/pymsteams-0.1.12[${PYTHON_USEDEP}] )
	mullvad? ( ~dev-python/mullvad-api-1.0.0[${PYTHON_USEDEP}] )
	mutesync? ( ~dev-python/mutesync-0.0.1[${PYTHON_USEDEP}] )
	mvglive? ( ~dev-python/PyMVGLive-1.1.4[${PYTHON_USEDEP}] )
	mycroft? ( ~dev-python/mycroftapi-2.0[${PYTHON_USEDEP}] )
	mysensors? ( ~dev-python/pymysensors-0.24.0[${PYTHON_USEDEP}] )
	mysql? ( >=dev-python/mysqlclient-1.4.0[${PYTHON_USEDEP}] )
	mystrom? ( ~dev-python/python-mystrom-2.2.0[${PYTHON_USEDEP}] )
	mythicbeastsdns? ( ~dev-python/mbddns-0.1.2[${PYTHON_USEDEP}] )
	myuplink? ( ~dev-python/myuplink-0.6.0[${PYTHON_USEDEP}] )
	nad? ( ~dev-python/nad-receiver-0.3.0[${PYTHON_USEDEP}] )
	nam? ( ~dev-python/nettigo-air-monitor-3.3.0[${PYTHON_USEDEP}] )
	namecheapdns? ( ~dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}] )
	nanoleaf? ( ~dev-python/aionanoleaf-0.2.1[${PYTHON_USEDEP}] )
	neato? ( ~dev-python/pybotvac-0.0.25[${PYTHON_USEDEP}] )
	nederlandse_spoorwegen? ( ~dev-python/nsapi-3.0.5[${PYTHON_USEDEP}] )
	ness_alarm? ( ~dev-python/nessclient-1.1.2[${PYTHON_USEDEP}] )
	nest? ( ~dev-python/google-nest-sdm-6.1.5[${PYTHON_USEDEP}] )
	netatmo? ( ~dev-python/pyatmo-8.1.0[${PYTHON_USEDEP}] )
	netdata? ( ~dev-python/netdata-1.1.0[${PYTHON_USEDEP}] )
	netgear? ( ~dev-python/pynetgear-0.10.10[${PYTHON_USEDEP}] )
	netgear_lte? ( ~dev-python/eternalegypt-0.0.16[${PYTHON_USEDEP}] )
	netio? ( ~dev-python/pynetio-0.1.9.1[${PYTHON_USEDEP}] )
	neurio_energy? ( ~dev-python/neurio-0.3.1[${PYTHON_USEDEP}] )
	nexia? ( ~dev-python/nexia-2.0.8[${PYTHON_USEDEP}] )
	nextbus? ( ~dev-python/py-nextbusnext-2.0.5[${PYTHON_USEDEP}] )
	nextcloud? ( ~dev-python/nextcloudmonitor-1.5.1[${PYTHON_USEDEP}] )
	nextdns? ( ~dev-python/nextdns-3.3.0[${PYTHON_USEDEP}] )
	nfandroidtv? ( ~dev-python/notifications-android-tv-0.1.5[${PYTHON_USEDEP}] )
	nibe_heatpump? ( ~dev-python/nibe-2.11.0[${PYTHON_USEDEP}] )
	nice_go? ( ~dev-python/nice-go-0.3.10[${PYTHON_USEDEP}] )
	nightscout? ( ~dev-python/py-nightscout-1.2.2[${PYTHON_USEDEP}] )
	niko_home_control? ( ~dev-python/niko-home-control-0.2.1[${PYTHON_USEDEP}] )
	nilu? ( ~dev-python/niluclient-0.1.2[${PYTHON_USEDEP}] )
	nina? ( ~dev-python/PyNINA-0.3.3[${PYTHON_USEDEP}] )
	nissan_leaf? ( ~dev-python/pycarwings2-2.14[${PYTHON_USEDEP}] )
	nmap_tracker? ( ~dev-python/aiooui-0.1.7[${PYTHON_USEDEP}] ~dev-python/getmac-0.9.4[${PYTHON_USEDEP}] ~dev-python/netmap-0.7.0.2[${PYTHON_USEDEP}] )
	nmbs? ( ~dev-python/pyrail-0.0.3[${PYTHON_USEDEP}] )
	noaa_tides? ( ~dev-python/noaa-coops-0.1.9[${PYTHON_USEDEP}] )
	nobo_hub? ( ~dev-python/pynobo-1.8.1[${PYTHON_USEDEP}] )
	norway_air? ( ~dev-python/PyMetno-0.13.0[${PYTHON_USEDEP}] )
	notify_events? ( ~dev-python/notify-events-1.0.4[${PYTHON_USEDEP}] )
	notion? ( ~dev-python/aionotion-2024.3.0[${PYTHON_USEDEP}] )
	nsw_fuel_station? ( ~dev-python/nsw-fuel-api-client-1.1.0[${PYTHON_USEDEP}] )
	nsw_rural_fire_service_feed? ( ~dev-python/aio-geojson-nsw-rfs-incidents-0.7[${PYTHON_USEDEP}] )
	nuheat? ( ~dev-python/nuheat-1.0.1[${PYTHON_USEDEP}] )
	nuki? ( ~dev-python/pynuki-1.6.3[${PYTHON_USEDEP}] )
	numato? ( ~dev-python/numato-gpio-0.13.0[${PYTHON_USEDEP}] )
	nut? ( ~dev-python/aionut-4.3.3[${PYTHON_USEDEP}] )
	nws? ( ~dev-python/pynws-1.8.2[${PYTHON_USEDEP},retry] )
	nx584? ( ~dev-python/pynx584-0.8.2[${PYTHON_USEDEP}] )
	nyt_games? ( ~dev-python/nyt-games-0.4.4[${PYTHON_USEDEP}] )
	nzbget? ( ~dev-python/pynzbgetapi-0.2.0[${PYTHON_USEDEP}] )
	oasa_telematics? ( ~dev-python/oasatelematics-0.3[${PYTHON_USEDEP}] )
	obihai? ( ~dev-python/pyobihai-1.4.2[${PYTHON_USEDEP}] )
	octoprint? ( ~dev-python/pyoctoprintapi-0.1.12[${PYTHON_USEDEP}] )
	oem? ( ~dev-python/oemthermostat-1.1.1[${PYTHON_USEDEP}] )
	ohmconnect? ( ~dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}] )
	ollama? ( ~dev-python/ollama-0.3.3[${PYTHON_USEDEP}] )
	ombi? ( ~dev-python/pyombi-0.1.10[${PYTHON_USEDEP}] )
	omnilogic? ( ~dev-python/omnilogic-0.4.5[${PYTHON_USEDEP}] )
	oncue? ( ~dev-python/aiooncue-0.3.7[${PYTHON_USEDEP}] )
	ondilo_ico? ( ~dev-python/ondilo-0.5.0[${PYTHON_USEDEP}] )
	onewire? ( ~dev-python/pyownet-0.10.0_p1[${PYTHON_USEDEP}] )
	onkyo? ( ~dev-python/pyeiscp-0.0.7[${PYTHON_USEDEP}] )
	onvif? ( ~dev-python/WSDiscovery-2.0.0[${PYTHON_USEDEP}] ~dev-python/onvif-zeep-async-3.1.12[${PYTHON_USEDEP}] )
	open_meteo? ( ~dev-python/open-meteo-0.3.1[${PYTHON_USEDEP}] )
	openai_conversation? ( ~dev-python/openai-1.35.7[${PYTHON_USEDEP}] )
	openerz? ( ~dev-python/openerz-api-0.3.0[${PYTHON_USEDEP}] )
	openevse? ( ~dev-python/openevsewifi-1.1.2[${PYTHON_USEDEP}] )
	openexchangerates? ( ~dev-python/aioopenexchangerates-0.6.8[${PYTHON_USEDEP}] )
	opengarage? ( ~dev-python/open-garage-0.2.0[${PYTHON_USEDEP}] )
	openhome? ( ~dev-python/openhomedevice-2.2.0[${PYTHON_USEDEP}] )
	opensensemap? ( ~dev-python/opensensemap-api-0.2.0[${PYTHON_USEDEP}] )
	opensky? ( ~dev-python/python-opensky-1.0.1[${PYTHON_USEDEP}] )
	opentherm_gw? ( ~dev-python/pyotgw-2.2.2[${PYTHON_USEDEP}] )
	openuv? ( ~dev-python/pyopenuv-2023.2.0[${PYTHON_USEDEP}] )
	openweathermap? ( ~dev-python/pyopenweathermap-0.2.1[${PYTHON_USEDEP}] )
	opnsense? ( ~dev-python/pyopnsense-0.4.0[${PYTHON_USEDEP}] )
	opower? ( ~dev-python/opower-0.8.6[${PYTHON_USEDEP}] )
	opple? ( ~dev-python/pyoppleio-legacy-1.0.8[${PYTHON_USEDEP}] )
	oralb? ( ~dev-python/oralb-ble-0.17.6[${PYTHON_USEDEP}] )
	oru? ( ~dev-python/oru-0.1.11[${PYTHON_USEDEP}] )
	orvibo? ( ~dev-python/orvibo-1.1.2[${PYTHON_USEDEP}] )
	osoenergy? ( ~dev-python/pyosoenergyapi-1.1.4[${PYTHON_USEDEP}] )
	osramlightify? ( ~dev-python/lightify-1.0.7.3[${PYTHON_USEDEP}] )
	otbr? ( ~dev-python/python-otbr-api-2.6.0[${PYTHON_USEDEP}] )
	otp? ( ~dev-python/pyotp-2.8.0[${PYTHON_USEDEP}] )
	ourgroceries? ( ~dev-python/ourgroceries-1.5.4[${PYTHON_USEDEP}] )
	overkiz? ( ~dev-python/pyoverkiz-1.14.1[${PYTHON_USEDEP}] )
	ovo_energy? ( ~dev-python/ovoenergy-2.0.0[${PYTHON_USEDEP}] )
	owntracks? ( ~dev-python/pynacl-1.5.0[${PYTHON_USEDEP}] )
	p1_monitor? ( ~dev-python/p1monitor-3.1.0[${PYTHON_USEDEP}] )
	palazzetti? ( ~dev-python/pypalazzetti-0.1.10[${PYTHON_USEDEP}] )
	panasonic_bluray? ( ~dev-python/panacotta-0.2[${PYTHON_USEDEP}] )
	panasonic_viera? ( ~dev-python/panasonic-viera-0.4.2[${PYTHON_USEDEP}] )
	pandora? ( ~dev-python/pexpect-4.6.0[${PYTHON_USEDEP}] )
	peco? ( ~dev-python/peco-0.0.30[${PYTHON_USEDEP}] )
	pegel_online? ( ~dev-python/aiopegelonline-0.0.10[${PYTHON_USEDEP}] )
	pencom? ( ~dev-python/pencompy-0.0.3[${PYTHON_USEDEP}] )
	permobil? ( ~dev-python/mypermobil-0.1.8[${PYTHON_USEDEP}] )
	philips_js? ( ~dev-python/ha-philipsjs-3.2.2[${PYTHON_USEDEP}] )
	pi_hole? ( ~dev-python/hole-0.8.0[${PYTHON_USEDEP}] )
	picnic? ( ~dev-python/python-picnic-api-1.1.0[${PYTHON_USEDEP}] )
	pilight? ( ~dev-python/pilight-0.1.1[${PYTHON_USEDEP}] )
	ping? ( ~dev-python/icmplib-3.0[${PYTHON_USEDEP}] )
	pjlink? ( ~dev-python/pypjlink2-1.2.1[${PYTHON_USEDEP}] )
	plaato? ( ~dev-python/pyplaato-0.0.19[${PYTHON_USEDEP}] )
	plex? ( ~dev-python/PlexAPI-4.15.16[${PYTHON_USEDEP}] ~dev-python/plexauth-0.0.6[${PYTHON_USEDEP}] ~dev-python/plexwebsocket-0.0.14[${PYTHON_USEDEP}] )
	plugwise? ( ~dev-python/plugwise-1.4.4[${PYTHON_USEDEP}] )
	plum_lightpad? ( ~dev-python/plumlightpad-0.0.11[${PYTHON_USEDEP}] )
	pocketcasts? ( ~dev-python/pycketcasts-1.0.1[${PYTHON_USEDEP}] )
	point? ( ~dev-python/pypoint-3.0.0[${PYTHON_USEDEP}] )
	poolsense? ( ~dev-python/poolsense-0.0.8[${PYTHON_USEDEP}] )
	postgres? ( >dev-python/psycopg-3.1.15[${PYTHON_USEDEP}] )
	powerwall? ( ~dev-python/tesla-powerwall-0.5.2[${PYTHON_USEDEP}] )
	private_ble_device? ( ~dev-python/bluetooth-data-tools-1.20.0[${PYTHON_USEDEP}] )
	profiler? ( ~dev-python/guppy3-3.1.4_p1[${PYTHON_USEDEP}] ~dev-python/objgraph-3.5.0[${PYTHON_USEDEP}] ~dev-python/pyprof2calltree-1.4.5[${PYTHON_USEDEP}] )
	progettihwsw? ( ~dev-python/ProgettiHWSW-0.1.3[${PYTHON_USEDEP}] )
	proliphix? ( ~dev-python/proliphix-0.4.1[${PYTHON_USEDEP}] )
	prometheus? ( ~dev-python/prometheus-client-0.21.0[${PYTHON_USEDEP}] )
	prosegur? ( ~dev-python/pyprosegur-0.0.9[${PYTHON_USEDEP}] )
	proxmoxve? ( ~dev-python/proxmoxer-2.0.1[${PYTHON_USEDEP}] )
	proxy? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] )
	prusalink? ( ~dev-python/pyprusalink-2.1.1[${PYTHON_USEDEP}] )
	ps4? ( ~dev-python/pyps4-2ndscreen-1.3.1[${PYTHON_USEDEP}] )
	pulseaudio_loopback? ( ~dev-python/pulsectl-23.5.2[${PYTHON_USEDEP}] )
	pure_energie? ( ~dev-python/gridnet-5.0.1[${PYTHON_USEDEP}] )
	purpleair? ( ~dev-python/aiopurpleair-2022.12.1[${PYTHON_USEDEP}] )
	pushbullet? ( ~dev-python/pushbullet-py-0.11.0[${PYTHON_USEDEP}] )
	pushover? ( ~dev-python/pushover_complete-1.1.1[${PYTHON_USEDEP}] )
	pvoutput? ( ~dev-python/pvo-2.1.1[${PYTHON_USEDEP}] )
	pvpc_hourly_pricing? ( ~dev-python/aiopvpc-4.2.2[${PYTHON_USEDEP}] )
	pyload? ( ~dev-python/PyLoadAPI-1.3.2[${PYTHON_USEDEP}] )
	python_script? ( ~dev-python/RestrictedPython-7.4[${PYTHON_USEDEP}] )
	qbittorrent? ( ~dev-python/qbittorrent-api-2024.2.59[${PYTHON_USEDEP}] )
	qingping? ( ~dev-python/qingping-ble-0.10.0[${PYTHON_USEDEP}] )
	qld_bushfire? ( ~dev-python/georss-qld-bushfire-alert-client-0.8[${PYTHON_USEDEP}] )
	qnap? ( ~dev-python/qnapstats-0.4.0[${PYTHON_USEDEP}] )
	qnap_qsw? ( ~dev-python/aioqsw-0.4.1[${PYTHON_USEDEP}] )
	qrcode? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] ~dev-python/pyzbar-0.1.7[${PYTHON_USEDEP}] )
	quantum_gateway? ( ~dev-python/quantum-gateway-0.0.8[${PYTHON_USEDEP}] )
	qvr_pro? ( ~dev-python/pyqvrpro-0.52[${PYTHON_USEDEP}] )
	qwikswitch? ( ~dev-python/pyqwikswitch-0.93[${PYTHON_USEDEP}] )
	rabbitair? ( ~dev-python/python-rabbitair-0.0.8[${PYTHON_USEDEP}] )
	rachio? ( ~dev-python/RachioPy-1.1.0[${PYTHON_USEDEP}] )
	radarr? ( ~dev-python/aiopyarr-23.4.0[${PYTHON_USEDEP}] )
	radio_browser? ( ~dev-python/pycountry-24.6.1[${PYTHON_USEDEP}] ~dev-python/radios-0.3.2[${PYTHON_USEDEP}] )
	radiotherm? ( ~dev-python/radiotherm-2.1.0[${PYTHON_USEDEP}] )
	rainbird? ( ~dev-python/pyrainbird-6.0.1[${PYTHON_USEDEP}] )
	raincloud? ( ~dev-python/raincloudy-0.0.7[${PYTHON_USEDEP}] )
	rainforest_eagle? ( ~dev-python/aioeagle-1.1.0[${PYTHON_USEDEP}] ~dev-python/eagle100-0.1.1[${PYTHON_USEDEP}] )
	rainforest_raven? ( ~dev-python/aioraven-0.7.0[${PYTHON_USEDEP}] )
	rainmachine? ( ~dev-python/regenmaschine-2024.3.0[${PYTHON_USEDEP}] )
	rapt_ble? ( ~dev-python/rapt-ble-0.1.2[${PYTHON_USEDEP}] )
	raspyrfm? ( ~dev-python/raspyrfm-client-1.2.8[${PYTHON_USEDEP}] )
	rdw? ( ~dev-python/vehicle-2.2.2[${PYTHON_USEDEP}] )
	recollect_waste? ( ~dev-python/aiorecollect-2023.9.0[${PYTHON_USEDEP}] )
	recorder? ( ~dev-python/sqlalchemy-2.0.31[${PYTHON_USEDEP}] ~dev-python/fnv-hash-fast-1.0.2[${PYTHON_USEDEP}] ~dev-python/psutil-home-assistant-0.0.1[${PYTHON_USEDEP}] )
	recswitch? ( ~dev-python/pyrecswitch-1.0.2[${PYTHON_USEDEP}] )
	reddit? ( ~dev-python/praw-7.5.0[${PYTHON_USEDEP}] )
	refoss? ( ~dev-python/refoss-ha-1.2.4[${PYTHON_USEDEP}] )
	rejseplanen? ( ~dev-python/rjpl-0.3.6[${PYTHON_USEDEP}] )
	remember_the_milk? ( ~dev-python/RtmAPI-0.7.2[${PYTHON_USEDEP}] ~dev-python/httplib2-0.20.4[${PYTHON_USEDEP}] )
	remote_rpi_gpio? ( ~dev-python/gpiozero-1.6.2[${PYTHON_USEDEP}] ~dev-python/pigpio-1.78[${PYTHON_USEDEP}] )
	renault? ( ~dev-python/renault-api-0.2.7[${PYTHON_USEDEP}] )
	renson? ( ~dev-python/renson-endura-delta-1.7.1[${PYTHON_USEDEP}] )
	reolink? ( ~dev-python/reolink-aio-0.11.2[${PYTHON_USEDEP}] )
	repetier? ( ~dev-python/pyrepetierng-0.1.0[${PYTHON_USEDEP}] )
	rest? ( ~dev-python/jsonpath-0.82.2[${PYTHON_USEDEP}] ~dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}] )
	rflink? ( ~dev-python/rflink-0.0.66[${PYTHON_USEDEP}] )
	rfxtrx? ( ~dev-python/pyRFXtrx-0.31.1[${PYTHON_USEDEP}] )
	ridwell? ( ~dev-python/aioridwell-2024.1.0[${PYTHON_USEDEP}] )
	ring? ( ~dev-python/ring-doorbell-0.9.12[${PYTHON_USEDEP}] )
	ripple? ( ~dev-python/python-ripple-api-0.0.3[${PYTHON_USEDEP}] )
	risco? ( ~dev-python/pyrisco-0.6.4[${PYTHON_USEDEP}] )
	rituals_perfume_genie? ( ~dev-python/pyrituals-0.0.6[${PYTHON_USEDEP}] )
	rmvtransport? ( ~dev-python/PyRMVtransport-0.3.3[${PYTHON_USEDEP}] )
	roborock? ( ~dev-python/python-roborock-2.7.2[${PYTHON_USEDEP}] ~dev-python/vacuum-map-parser-roborock-0.1.2[${PYTHON_USEDEP}] )
	rocketchat? ( ~dev-python/rocketchat-API-0.6.1[${PYTHON_USEDEP}] )
	roku? ( ~dev-python/rokuecp-0.19.3[${PYTHON_USEDEP}] )
	romy? ( ~dev-python/romy-0.0.10[${PYTHON_USEDEP}] )
	roomba? ( ~dev-python/roombapy-1.8.1[${PYTHON_USEDEP}] )
	roon? ( ~dev-python/roonapi-0.1.6[${PYTHON_USEDEP}] )
	route53? ( ~dev-python/boto3-1.34.131[${PYTHON_USEDEP}] )
	rova? ( ~dev-python/rova-0.4.1[${PYTHON_USEDEP}] )
	rpi_power? ( ~dev-python/rpi-bad-power-0.1.0[${PYTHON_USEDEP}] )
	rtsp_to_webrtc? ( ~dev-python/rtsp-to-webrtc-0.5.1[${PYTHON_USEDEP}] )
	ruckus_unleashed? ( ~dev-python/aioruckus-0.42[${PYTHON_USEDEP}] )
	russound_rio? ( ~dev-python/aiorussound-4.0.5[${PYTHON_USEDEP}] )
	russound_rnet? ( ~dev-python/russound-0.2.0[${PYTHON_USEDEP}] )
	ruuvi_gateway? ( ~dev-python/aioruuvigateway-0.1.0[${PYTHON_USEDEP}] )
	ruuvitag_ble? ( ~dev-python/ruuvitag-ble-0.1.2[${PYTHON_USEDEP}] )
	rympro? ( ~dev-python/pyrympro-0.0.8[${PYTHON_USEDEP}] )
	sabnzbd? ( ~dev-python/pysabnzbd-1.1.1[${PYTHON_USEDEP}] )
	saj? ( ~dev-python/pysaj-0.0.16[${PYTHON_USEDEP}] )
	samsungtv? ( ~dev-python/async-upnp-client-0.41.0[${PYTHON_USEDEP}] ~dev-python/getmac-0.9.4[${PYTHON_USEDEP}] ~dev-python/samsungctl-0.7.1[${PYTHON_USEDEP},websocket] ~dev-python/samsungtvws-2.6.0[${PYTHON_USEDEP},async,encrypted] ~dev-python/wakeonlan-2.1.0[${PYTHON_USEDEP}] )
	sanix? ( ~dev-python/sanix-1.0.6[${PYTHON_USEDEP}] )
	satel_integra? ( ~dev-python/satel-integra-0.3.7[${PYTHON_USEDEP}] )
	schlage? ( ~dev-python/pyschlage-2024.8.0[${PYTHON_USEDEP}] )
	schluter? ( ~dev-python/py-schluter-0.1.7[${PYTHON_USEDEP}] )
	scrape? ( ~dev-python/beautifulsoup4-4.12.3[${PYTHON_USEDEP}] ~dev-python/lxml-5.3.0[${PYTHON_USEDEP}] )
	screenlogic? ( ~dev-python/screenlogicpy-0.10.0[${PYTHON_USEDEP}] )
	scsgate? ( ~dev-python/scsgate-0.1.0[${PYTHON_USEDEP}] )
	season? ( ~dev-python/ephem-4.1.6[${PYTHON_USEDEP}] )
	sendgrid? ( ~dev-python/sendgrid-6.8.2[${PYTHON_USEDEP}] )
	sense? ( ~dev-python/sense-energy-0.13.4[${PYTHON_USEDEP}] )
	sensibo? ( ~dev-python/pysensibo-1.1.0[${PYTHON_USEDEP}] )
	sensirion_ble? ( ~dev-python/sensirion-ble-0.1.1[${PYTHON_USEDEP}] )
	sensorpro? ( ~dev-python/sensorpro-ble-0.5.3[${PYTHON_USEDEP}] )
	sensorpush? ( ~dev-python/sensorpush-ble-1.7.1[${PYTHON_USEDEP}] )
	sensoterra? ( ~dev-python/sensoterra-2.0.1[${PYTHON_USEDEP}] )
	sentry? ( ~dev-python/sentry-sdk-1.40.3[${PYTHON_USEDEP}] )
	senz? ( ~dev-python/aiosenz-1.0.0[${PYTHON_USEDEP}] )
	serial? ( ~dev-python/pyserial-asyncio-fast-0.13[${PYTHON_USEDEP}] )
	serial_pm? ( ~dev-python/pmsensor-0.4[${PYTHON_USEDEP}] )
	sesame? ( ~dev-python/pysesame2-1.0.1[${PYTHON_USEDEP}] )
	seven_segments? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] )
	seventeentrack? ( ~dev-python/pyseventeentrack-1.0.1[${PYTHON_USEDEP}] )
	sfr_box? ( ~dev-python/sfrbox-api-0.0.11[${PYTHON_USEDEP}] )
	sharkiq? ( ~dev-python/sharkiq-1.0.2[${PYTHON_USEDEP}] )
	shelly? ( ~dev-python/aioshelly-12.0.1[${PYTHON_USEDEP}] )
	shodan? ( ~net-analyzer/shodan-1.28.0[${PYTHON_USEDEP}] )
	sia? ( ~dev-python/pysiaalarm-3.1.1[${PYTHON_USEDEP}] )
	sighthound? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] ~dev-python/simplehound-0.3[${PYTHON_USEDEP}] )
	signal_messenger? ( ~dev-python/pysignalclirestapi-0.3.24[${PYTHON_USEDEP}] )
	simplefin? ( ~dev-python/simplefin4py-0.0.18[${PYTHON_USEDEP}] )
	simplepush? ( ~dev-python/simplepush-2.2.3[${PYTHON_USEDEP}] )
	simplisafe? ( ~dev-python/simplisafe-python-2024.1.0[${PYTHON_USEDEP}] )
	sinch? ( ~dev-python/clx-sdk-xms-1.0.0[${PYTHON_USEDEP}] )
	sisyphus? ( ~dev-python/sisyphus-control-3.1.4[${PYTHON_USEDEP}] )
	sky_hub? ( ~dev-python/pyskyqhub-0.1.4[${PYTHON_USEDEP}] )
	skybeacon? ( ~dev-python/pygatt-4.0.5[${PYTHON_USEDEP},GATTTOOL] )
	skybell? ( ~dev-python/aioskybell-22.7.0[${PYTHON_USEDEP}] )
	slack? ( ~dev-python/slackclient-2.5.0[${PYTHON_USEDEP}] )
	sleepiq? ( ~dev-python/asyncsleepiq-1.5.2[${PYTHON_USEDEP}] )
	slide? ( ~dev-python/goslide-api-0.7.0[${PYTHON_USEDEP}] )
	slimproto? ( ~dev-python/aioslimproto-3.0.0[${PYTHON_USEDEP}] )
	sma? ( ~dev-python/pysma-0.7.3[${PYTHON_USEDEP}] )
	smappee? ( ~dev-python/pysmappee-0.2.29[${PYTHON_USEDEP}] )
	smart_meter_texas? ( ~dev-python/smart-meter-texas-0.5.5[${PYTHON_USEDEP}] )
	smartthings? ( ~dev-python/pysmartapp-0.3.5[${PYTHON_USEDEP}] ~dev-python/pysmartthings-0.7.8[${PYTHON_USEDEP}] )
	smarttub? ( ~dev-python/python-smarttub-0.0.38[${PYTHON_USEDEP}] )
	smarty? ( ~dev-python/pysmarty2-0.10.1[${PYTHON_USEDEP}] )
	smhi? ( ~dev-python/smhi-pkg-1.0.18[${PYTHON_USEDEP}] )
	smlight? ( ~dev-python/pysmlight-0.1.3[${PYTHON_USEDEP}] )
	sms? ( ~dev-python/python-gammu-3.2.4[${PYTHON_USEDEP}] )
	snapcast? ( ~dev-python/snapcast-2.3.6[${PYTHON_USEDEP}] )
	snmp? ( ~dev-python/pysnmp-6.2.6[${PYTHON_USEDEP}] )
	snooz? ( ~dev-python/pysnooz-0.8.6[${PYTHON_USEDEP}] )
	socat? ( net-misc/socat[${PYTHON_USEDEP}] )
	solaredge? ( ~dev-python/aiosolaredge-0.2.0[${PYTHON_USEDEP}] ~dev-python/stringcase-1.2.0[${PYTHON_USEDEP}] )
	solaredge_local? ( ~dev-python/solaredge-local-0.2.3[${PYTHON_USEDEP}] )
	solarlog? ( ~dev-python/solarlog_cli-0.3.2[${PYTHON_USEDEP}] )
	solax? ( ~dev-python/solax-3.1.1[${PYTHON_USEDEP}] )
	soma? ( ~dev-python/pysoma-0.0.12[${PYTHON_USEDEP}] )
	somfy_mylink? ( ~dev-python/somfy-mylink-synergy-1.0.6[${PYTHON_USEDEP}] )
	sonarr? ( ~dev-python/aiopyarr-23.4.0[${PYTHON_USEDEP}] )
	songpal? ( ~dev-python/python-songpal-0.16.2[${PYTHON_USEDEP}] )
	sonos? ( ~dev-python/soco-0.30.6[${PYTHON_USEDEP}] ~dev-python/sonos-websocket-0.1.3[${PYTHON_USEDEP}] )
	sony_projector? ( ~dev-python/pySDCP-1[${PYTHON_USEDEP}] )
	soundtouch? ( ~dev-python/libsoundtouch-0.8[${PYTHON_USEDEP}] )
	spc? ( ~dev-python/pyspcwebgw-0.7.0[${PYTHON_USEDEP}] )
	speedtestdotnet? ( ~net-analyzer/speedtest-cli-2.1.3[${PYTHON_USEDEP}] )
	splunk? ( ~dev-python/hass-splunk-0.1.1[${PYTHON_USEDEP}] )
	spotify? ( ~dev-python/spotifyaio-0.8.8[${PYTHON_USEDEP}] )
	sql? ( ~dev-python/sqlalchemy-2.0.31[${PYTHON_USEDEP}] ~dev-python/sqlparse-0.5.0[${PYTHON_USEDEP}] )
	squeezebox? ( ~dev-python/pysqueezebox-0.10.0[${PYTHON_USEDEP}] )
	srp_energy? ( ~dev-python/srpenergy-1.3.6[${PYTHON_USEDEP}] )
	ssdp? ( ~dev-python/async-upnp-client-0.41.0[${PYTHON_USEDEP}] )
	ssl? ( net-proxy/haproxy[ssl] )
	starline? ( ~dev-python/starline-0.1.5[${PYTHON_USEDEP}] )
	starlingbank? ( ~dev-python/starlingbank-3.2[${PYTHON_USEDEP}] )
	starlink? ( ~dev-python/starlink-grpc-core-1.1.3[${PYTHON_USEDEP}] )
	startca? ( ~dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}] )
	statsd? ( ~dev-python/statsd-3.2.1[${PYTHON_USEDEP}] )
	steam_online? ( ~dev-python/steamodd-4.21[${PYTHON_USEDEP}] )
	steamist? ( ~dev-python/aiosteamist-1.0.0[${PYTHON_USEDEP}] ~dev-python/discovery30303-0.3.2[${PYTHON_USEDEP}] )
	stiebel_eltron? ( ~dev-python/pystiebeleltron-0.0.1_pre2[${PYTHON_USEDEP}] )
	stookalert? ( ~dev-python/stookalert-0.1.4[${PYTHON_USEDEP}] )
	stookwijzer? ( ~dev-python/stookwijzer-1.3.0[${PYTHON_USEDEP}] )
	stream? ( ~dev-python/PyTurboJPEG-1.7.5[${PYTHON_USEDEP}] ~dev-python/ha-av-10.1.1[${PYTHON_USEDEP}] ~dev-python/numpy-1.26.4[${PYTHON_USEDEP}] )
	streamlabswater? ( ~dev-python/streamlabswater-1.0.1[${PYTHON_USEDEP}] )
	subaru? ( ~dev-python/subarulink-0.7.11[${PYTHON_USEDEP}] )
	suez_water? ( ~dev-python/pysuezV2-0.2.2[${PYTHON_USEDEP}] )
	sunweg? ( ~dev-python/sunweg-3.0.2[${PYTHON_USEDEP}] )
	supla? ( ~dev-python/asyncpysupla-0.0.5[${PYTHON_USEDEP}] )
	surepetcare? ( ~dev-python/surepy-0.9.0[${PYTHON_USEDEP}] )
	swiss_hydrological_data? ( ~dev-python/swisshydrodata-0.1.0[${PYTHON_USEDEP}] )
	swiss_public_transport? ( ~dev-python/python-opendata-transport-0.5.0[${PYTHON_USEDEP}] )
	switchbee? ( ~dev-python/pyswitchbee-1.8.3[${PYTHON_USEDEP}] )
	switchbot? ( ~dev-python/PySwitchbot-0.51.0[${PYTHON_USEDEP}] )
	switchbot_cloud? ( ~dev-python/switchbot-api-2.2.1[${PYTHON_USEDEP}] )
	switcher_kis? ( ~dev-python/aioswitcher-4.4.0[${PYTHON_USEDEP}] )
	switchmate? ( ~dev-python/PySwitchmate-0.5.1[${PYTHON_USEDEP}] )
	syncthing? ( ~dev-python/aiosyncthing-0.5.1[${PYTHON_USEDEP}] )
	syncthru? ( ~dev-python/PySyncThru-0.7.10[${PYTHON_USEDEP}] ~dev-python/url-normalize-1.4.3[${PYTHON_USEDEP}] )
	synology_dsm? ( ~dev-python/py-synologydsm-api-2.5.3[${PYTHON_USEDEP}] )
	synology_srm? ( ~dev-python/synology-srm-0.2.0[${PYTHON_USEDEP}] )
	system_bridge? ( ~dev-python/systembridgeconnector-4.1.5[${PYTHON_USEDEP}] ~dev-python/systembridgemodels-4.2.4[${PYTHON_USEDEP}] )
	systemmonitor? ( ~dev-python/psutil-6.0.0[${PYTHON_USEDEP}] ~dev-python/psutil-home-assistant-0.0.1[${PYTHON_USEDEP}] )
	tado? ( ~dev-python/python-tado-0.17.6[${PYTHON_USEDEP}] )
	tailscale? ( ~dev-python/tailscale-0.6.1[${PYTHON_USEDEP}] )
	tailwind? ( ~dev-python/gotailwind-0.2.4[${PYTHON_USEDEP}] )
	tami4? ( ~dev-python/Tami4EdgeAPI-3.0[${PYTHON_USEDEP}] )
	tank_utility? ( ~dev-python/tank-utility-1.5.0[${PYTHON_USEDEP}] )
	tankerkoenig? ( ~dev-python/aiotankerkoenig-0.4.2[${PYTHON_USEDEP}] )
	tapsaff? ( ~dev-python/tapsaff-0.2.1[${PYTHON_USEDEP}] )
	tasmota? ( ~dev-python/HATasmota-0.9.2[${PYTHON_USEDEP}] )
	tautulli? ( ~dev-python/pytautulli-23.1.1[${PYTHON_USEDEP}] )
	technove? ( ~dev-python/python-technove-1.3.1[${PYTHON_USEDEP}] )
	ted5000? ( ~dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}] )
	tedee? ( ~dev-python/pytedee-async-0.2.20[${PYTHON_USEDEP}] )
	telegram_bot? ( ~dev-python/python-telegram-bot-21.5[${PYTHON_USEDEP},socks] )
	tellduslive? ( ~dev-python/tellduslive-0.10.12[${PYTHON_USEDEP}] )
	tellstick? ( ~dev-python/tellcore-net-0.4[${PYTHON_USEDEP}] ~dev-python/tellcore-py-1.1.2[${PYTHON_USEDEP}] )
	temper? ( ~dev-python/temperusb-1.6.1[${PYTHON_USEDEP}] )
	tensorflow? ( ~dev-python/pillow-10.4.0[${PYTHON_USEDEP}] ~dev-python/numpy-1.26.4[${PYTHON_USEDEP}] ~dev-python/pycocotools-2.0.6[${PYTHON_USEDEP}] ~dev-python/tensorflow-2.5.0[${PYTHON_USEDEP}] ~dev-python/tf-models-official-2.5.0[${PYTHON_USEDEP}] )
	tesla_fleet? ( ~dev-python/tesla-fleet-api-0.8.4[${PYTHON_USEDEP}] )
	tesla_wall_connector? ( ~dev-python/tesla-wall-connector-1.0.2[${PYTHON_USEDEP}] )
	teslemetry? ( ~dev-python/tesla-fleet-api-0.8.4[${PYTHON_USEDEP}] ~dev-python/teslemetry-stream-0.4.2[${PYTHON_USEDEP}] )
	tessie? ( ~dev-python/tesla-fleet-api-0.8.4[${PYTHON_USEDEP}] ~dev-python/tessie-api-0.1.1[${PYTHON_USEDEP}] )
	tfiac? ( ~dev-python/pytfiac-0.4[${PYTHON_USEDEP}] )
	thermobeacon? ( ~dev-python/thermobeacon-ble-0.7.0[${PYTHON_USEDEP}] )
	thermopro? ( ~dev-python/thermopro-ble-0.10.0[${PYTHON_USEDEP}] )
	thermoworks_smoke? ( ~dev-python/stringcase-1.2.0[${PYTHON_USEDEP}] ~dev-python/thermoworks-smoke-0.1.8[${PYTHON_USEDEP}] )
	thethingsnetwork? ( ~dev-python/ttn-client-1.2.0[${PYTHON_USEDEP}] )
	thingspeak? ( ~dev-python/thingspeak-1.0.0[${PYTHON_USEDEP}] )
	thinkingcleaner? ( ~dev-python/pythinkingcleaner-0.0.3[${PYTHON_USEDEP}] )
	thread? ( ~dev-python/pyroute2-0.7.5[${PYTHON_USEDEP}] ~dev-python/python-otbr-api-2.6.0[${PYTHON_USEDEP}] )
	tibber? ( ~dev-python/pyTibber-0.30.8[${PYTHON_USEDEP}] )
	tikteck? ( ~dev-python/tikteck-0.4[${PYTHON_USEDEP}] )
	tile? ( ~dev-python/pytile-2023.12.0[${PYTHON_USEDEP}] )
	tilt_ble? ( ~dev-python/tilt-ble-0.2.3[${PYTHON_USEDEP}] )
	tmb? ( ~dev-python/tmb-0.0.4[${PYTHON_USEDEP}] )
	todoist? ( ~dev-python/todoist-api-python-2.1.2[${PYTHON_USEDEP}] )
	tolo? ( ~dev-python/tololib-1.1.0[${PYTHON_USEDEP}] )
	tomorrowio? ( ~dev-python/pytomorrowio-0.3.6[${PYTHON_USEDEP}] )
	toon? ( ~dev-python/toonapi-0.3.0[${PYTHON_USEDEP}] )
	totalconnect? ( ~dev-python/total-connect-client-2024.5[${PYTHON_USEDEP}] )
	touchline? ( ~dev-python/pytouchline-0.7[${PYTHON_USEDEP}] )
	touchline_sl? ( ~dev-python/pytouchlinesl-0.1.8[${PYTHON_USEDEP}] )
	tplink? ( ~dev-python/python-kasa-0.7.7[${PYTHON_USEDEP},speedups] )
	tplink_lte? ( ~dev-python/tp-connected-0.0.4[${PYTHON_USEDEP}] )
	tplink_omada? ( ~dev-python/tplink-omada-client-1.4.2[${PYTHON_USEDEP}] )
	traccar? ( ~dev-python/pytraccar-2.1.1[${PYTHON_USEDEP}] ~dev-python/stringcase-1.2.0[${PYTHON_USEDEP}] )
	traccar_server? ( ~dev-python/pytraccar-2.1.1[${PYTHON_USEDEP}] )
	tractive? ( ~dev-python/aiotractive-0.6.0[${PYTHON_USEDEP}] )
	tradfri? ( ~dev-python/pytradfri-9.0.1[${PYTHON_USEDEP},async] )
	trafikverket_camera? ( ~dev-python/pytrafikverket-1.0.0[${PYTHON_USEDEP}] )
	trafikverket_ferry? ( ~dev-python/pytrafikverket-1.0.0[${PYTHON_USEDEP}] )
	trafikverket_train? ( ~dev-python/pytrafikverket-1.0.0[${PYTHON_USEDEP}] )
	trafikverket_weatherstation? ( ~dev-python/pytrafikverket-1.0.0[${PYTHON_USEDEP}] )
	transmission? ( ~dev-python/transmission-rpc-7.0.3[${PYTHON_USEDEP}] )
	transport_nsw? ( ~dev-python/PyTransportNSW-0.1.1[${PYTHON_USEDEP}] )
	travisci? ( ~dev-python/TravisPy-0.3.5[${PYTHON_USEDEP}] )
	trend? ( ~dev-python/numpy-1.26.4[${PYTHON_USEDEP}] )
	triggercmd? ( ~dev-python/triggercmd-0.0.27[${PYTHON_USEDEP}] )
	tts? ( ~media-libs/mutagen-1.47.0[${PYTHON_USEDEP}] )
	tuya? ( ~dev-python/tuya-device-sharing-sdk-0.1.9[${PYTHON_USEDEP}] )
	twentemilieu? ( ~dev-python/twentemilieu-2.1.0[${PYTHON_USEDEP}] )
	twilio? ( ~dev-python/twilio-6.32.0[${PYTHON_USEDEP}] )
	twinkly? ( ~dev-python/ttls-1.8.3[${PYTHON_USEDEP}] )
	twitch? ( ~dev-python/twitchAPI-4.2.1[${PYTHON_USEDEP}] )
	twitter? ( ~dev-python/TwitterAPI-2.7.12[${PYTHON_USEDEP}] )
	ubus? ( ~dev-python/openwrt-ubus-rpc-0.0.2[${PYTHON_USEDEP}] )
	ukraine_alarm? ( ~dev-python/uasiren-0.0.1[${PYTHON_USEDEP}] )
	unifi? ( ~dev-python/aiounifi-80[${PYTHON_USEDEP}] )
	unifi_direct? ( ~dev-python/unifi-ap-0.0.1[${PYTHON_USEDEP}] )
	unifiled? ( ~dev-python/unifiled-0.11[${PYTHON_USEDEP}] )
	unifiprotect? ( ~dev-python/uiprotect-6.4.0[${PYTHON_USEDEP}] ~dev-python/unifi-discovery-1.2.0[${PYTHON_USEDEP}] )
	upb? ( ~dev-python/upb-lib-0.5.8[${PYTHON_USEDEP}] )
	upc_connect? ( ~dev-python/connect-box-0.3.1[${PYTHON_USEDEP}] )
	upcloud? ( ~dev-python/upcloud-api-2.6.0[${PYTHON_USEDEP}] )
	upnp? ( ~dev-python/async-upnp-client-0.41.0[${PYTHON_USEDEP}] ~dev-python/getmac-0.9.4[${PYTHON_USEDEP}] )
	uptimerobot? ( ~dev-python/pyuptimerobot-22.2.0[${PYTHON_USEDEP}] )
	usb? ( ~dev-python/pyserial-3.5[${PYTHON_USEDEP}] ~dev-python/pyudev-0.24.1[${PYTHON_USEDEP}] )
	usgs_earthquakes_feed? ( ~dev-python/aio-geojson-usgs-earthquakes-0.3[${PYTHON_USEDEP}] )
	utility_meter? ( ~dev-python/croniter-2.0.2[${PYTHON_USEDEP}] )
	uvc? ( ~dev-python/uvcclient-0.12.1[${PYTHON_USEDEP}] )
	v2c? ( ~dev-python/pytrydan-0.8.0[${PYTHON_USEDEP}] )
	vallox? ( ~dev-python/vallox-websocket-api-5.3.0[${PYTHON_USEDEP}] )
	vasttrafik? ( ~dev-python/vtjp-0.2.1[${PYTHON_USEDEP}] )
	velbus? ( ~dev-python/velbus-aio-2024.10.0[${PYTHON_USEDEP}] )
	velux? ( ~dev-python/pyvlx-0.2.21[${PYTHON_USEDEP}] )
	venstar? ( ~dev-python/venstarcolortouch-0.19[${PYTHON_USEDEP}] )
	vera? ( ~dev-python/pyvera-0.3.15[${PYTHON_USEDEP}] )
	verisure? ( ~dev-python/vsure-2.6.7[${PYTHON_USEDEP}] )
	versasense? ( ~dev-python/pyversasense-0.0.6[${PYTHON_USEDEP}] )
	version? ( ~dev-python/pyhaversion-22.8.0[${PYTHON_USEDEP}] )
	vesync? ( ~dev-python/pyvesync-2.1.12[${PYTHON_USEDEP}] )
	vicare? ( ~dev-python/PyViCare-2.35.0[${PYTHON_USEDEP}] )
	vilfo? ( ~dev-python/vilfo-api-client-0.5.0[${PYTHON_USEDEP}] )
	vivotek? ( ~dev-python/libpyvivotek-0.4.0[${PYTHON_USEDEP}] )
	vizio? ( ~dev-python/pyvizio-0.1.61[${PYTHON_USEDEP}] )
	vlc? ( ~dev-python/python-vlc-3.0.18122[${PYTHON_USEDEP}] )
	vlc_telnet? ( ~dev-python/aiovlc-0.5.1[${PYTHON_USEDEP}] )
	vodafone_station? ( ~dev-python/aiovodafone-0.6.1[${PYTHON_USEDEP}] )
	voip? ( ~dev-python/voip-utils-0.1.0[${PYTHON_USEDEP}] )
	volkszaehler? ( ~dev-python/volkszaehler-0.4.0[${PYTHON_USEDEP}] )
	volumio? ( ~dev-python/pyvolumio-0.1.5[${PYTHON_USEDEP}] )
	volvooncall? ( ~dev-python/volvooncall-0.10.3[${PYTHON_USEDEP}] )
	vulcan? ( ~dev-python/vulcan-api-2.3.2[${PYTHON_USEDEP}] )
	vultr? ( ~dev-python/vultr-0.1.2[${PYTHON_USEDEP}] )
	w800rf32? ( ~dev-python/pyW800rf32-0.4[${PYTHON_USEDEP}] )
	wake_on_lan? ( ~dev-python/wakeonlan-2.1.0[${PYTHON_USEDEP}] )
	wallbox? ( ~dev-python/wallbox-0.7.0[${PYTHON_USEDEP}] )
	waqi? ( ~dev-python/aiowaqi-3.1.0[${PYTHON_USEDEP}] )
	waterfurnace? ( ~dev-python/waterfurnace-1.1.0[${PYTHON_USEDEP}] )
	watson_iot? ( ~dev-python/ibmiotf-0.3.4[${PYTHON_USEDEP}] )
	watson_tts? ( ~dev-python/ibm-watson-5.2.2[${PYTHON_USEDEP}] )
	watttime? ( ~dev-python/aiowatttime-0.1.1[${PYTHON_USEDEP}] )
	waze_travel_time? ( ~dev-python/pywaze-1.0.2[${PYTHON_USEDEP}] )
	weatherflow? ( ~dev-python/pyweatherflowudp-1.4.5[${PYTHON_USEDEP}] )
	weatherflow_cloud? ( ~dev-python/weatherflow4py-1.0.6[${PYTHON_USEDEP}] )
	weatherkit? ( ~dev-python/apple_weatherkit-1.1.3[${PYTHON_USEDEP}] )
	webmin? ( ~dev-python/webmin-xmlrpc-0.0.2[${PYTHON_USEDEP}] )
	webostv? ( ~dev-python/aiowebostv-0.4.2[${PYTHON_USEDEP}] )
	weheat? ( ~dev-python/weheat-2024.9.23[${PYTHON_USEDEP}] )
	wemo? ( ~dev-python/pywemo-1.4.0[${PYTHON_USEDEP}] )
	whirlpool? ( ~dev-python/whirlpool-sixth-sense-0.18.8[${PYTHON_USEDEP}] )
	whois? ( ~dev-python/whois-0.9.27[${PYTHON_USEDEP}] )
	wiffi? ( ~dev-python/wiffi-1.1.2[${PYTHON_USEDEP}] )
	wilight? ( ~dev-python/pywilight-0.0.74[${PYTHON_USEDEP}] )
	wirelesstag? ( ~dev-python/wirelesstagpy-0.8.1[${PYTHON_USEDEP}] )
	withings? ( ~dev-python/aiowithings-3.1.3[${PYTHON_USEDEP}] )
	wiz? ( ~dev-python/pywizlight-0.5.14[${PYTHON_USEDEP}] )
	wled? ( ~dev-python/wled-0.20.2[${PYTHON_USEDEP}] )
	wmspro? ( ~dev-python/pywmspro-0.2.1[${PYTHON_USEDEP}] )
	wolflink? ( ~dev-python/wolf-comm-0.0.15[${PYTHON_USEDEP}] )
	workday? ( ~dev-python/holidays-0.61[${PYTHON_USEDEP}] )
	ws66i? ( ~dev-python/pyws66i-1.1[${PYTHON_USEDEP}] )
	wyoming? ( ~dev-python/wyoming-1.5.4[${PYTHON_USEDEP}] )
	xbox? ( ~dev-python/xbox-webapi-2.0.11[${PYTHON_USEDEP}] )
	xeoma? ( ~dev-python/pyxeoma-1.4.2[${PYTHON_USEDEP}] )
	xiaomi_aqara? ( ~dev-python/PyXiaomiGateway-0.14.3[${PYTHON_USEDEP}] )
	xiaomi_ble? ( ~dev-python/xiaomi-ble-0.33.0[${PYTHON_USEDEP}] )
	xiaomi_miio? ( ~dev-python/construct-2.10.68[${PYTHON_USEDEP}] ~dev-python/micloud-0.5[${PYTHON_USEDEP}] ~dev-python/python-miio-0.5.12[${PYTHON_USEDEP}] )
	xiaomi_tv? ( ~dev-python/pymitv-1.4.3[${PYTHON_USEDEP}] )
	xmpp? ( ~dev-python/emoji-2.8.0[${PYTHON_USEDEP}] ~dev-python/slixmpp-1.8.5[${PYTHON_USEDEP}] )
	xs1? ( ~dev-python/xs1-api-client-3.0.0[${PYTHON_USEDEP}] )
	yale? ( ~dev-python/yalexs-8.10.0[${PYTHON_USEDEP}] ~dev-python/yalexs-ble-2.5.0[${PYTHON_USEDEP}] )
	yale_smart_alarm? ( ~dev-python/yalesmartalarmclient-0.4.3[${PYTHON_USEDEP}] )
	yalexs_ble? ( ~dev-python/yalexs-ble-2.5.0[${PYTHON_USEDEP}] )
	yamaha? ( ~dev-python/rxv-0.7.0[${PYTHON_USEDEP}] )
	yamaha_musiccast? ( ~dev-python/aiomusiccast-0.14.8[${PYTHON_USEDEP}] )
	yandex_transport? ( ~dev-python/aioymaps-1.2.5[${PYTHON_USEDEP}] )
	yardian? ( ~dev-python/pyyardian-1.1.1[${PYTHON_USEDEP}] )
	yeelight? ( ~dev-python/async-upnp-client-0.41.0[${PYTHON_USEDEP}] ~dev-python/yeelight-0.7.14[${PYTHON_USEDEP}] )
	yeelightsunflower? ( ~dev-python/yeelightsunflower-0.0.10[${PYTHON_USEDEP}] )
	yi? ( ~dev-python/aioftp-0.21.3[${PYTHON_USEDEP}] )
	yolink? ( ~dev-python/yolink-api-0.4.7[${PYTHON_USEDEP}] )
	youless? ( ~dev-python/youless-api-2.1.2[${PYTHON_USEDEP}] )
	youtube? ( ~dev-python/youtubeaio-1.1.5[${PYTHON_USEDEP}] )
	zabbix? ( ~dev-python/py-zabbix-1.1.7[${PYTHON_USEDEP}] )
	zamg? ( ~dev-python/zamg-0.3.6[${PYTHON_USEDEP}] )
	zengge? ( ~dev-python/bluepy-1.3.0[${PYTHON_USEDEP}] ~dev-python/zengge-0.2[${PYTHON_USEDEP}] )
	zeroconf? ( ~dev-python/zeroconf-0.136.0[${PYTHON_USEDEP}] )
	zerproc? ( ~dev-python/pyzerproc-0.4.8[${PYTHON_USEDEP}] )
	zestimate? ( ~dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}] )
	zeversolar? ( ~dev-python/zeversolar-0.3.2[${PYTHON_USEDEP}] )
	zha? ( ~dev-python/universal-silabs-flasher-0.0.25[${PYTHON_USEDEP}] ~dev-python/zha-0.0.39[${PYTHON_USEDEP}] )
	zhong_hong? ( ~dev-python/zhong-hong-hvac-1.0.13[${PYTHON_USEDEP}] )
	ziggo_mediabox_xl? ( ~dev-python/ziggo-mediabox-xl-1.1.0[${PYTHON_USEDEP}] )
	zoneminder? ( ~dev-python/zm-py-0.5.4[${PYTHON_USEDEP}] )
	zwave_js? ( ~dev-python/pyserial-3.5[${PYTHON_USEDEP}] ~dev-python/zwave-js-server-python-0.58.1[${PYTHON_USEDEP}] )
	zwave_me? ( ~dev-python/url-normalize-1.4.3[${PYTHON_USEDEP}] ~dev-python/zwave-me-ws-0.4.3[${PYTHON_USEDEP}] )"

BDEPEND="${RDEPEND}
	>=dev-python/setuptools-69.2.0[${PYTHON_USEDEP}]
	>=dev-python/wheel-0.43.0[${PYTHON_USEDEP}]
	test? (
		>=dev-python/astroid-3.3.5[${PYTHON_USEDEP}]
		>=dev-python/codespell-2.3.0[${PYTHON_USEDEP}]
		>=dev-python/coverage-7.6.1[${PYTHON_USEDEP}]
		>=dev-python/freezegun-1.5.1[${PYTHON_USEDEP}]
		>=dev-python/license-expression-30.4.0[${PYTHON_USEDEP}]
		>=dev-python/mock-open-1.4.0[${PYTHON_USEDEP}]
		>=dev-python/mypy-dev-1.13.0_alpha1[${PYTHON_USEDEP}]
		>=dev-python/pipdeptree-2.23.4[${PYTHON_USEDEP}]
		>=dev-python/pre-commit-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-1.10.18[${PYTHON_USEDEP}]
		>=dev-python/pylint-3.3.1[${PYTHON_USEDEP}]
		>=dev-python/pylint-per-file-ignores-1.3.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-aiohttp-1.0.5[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.24.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-freezer-0.4.8[${PYTHON_USEDEP}]
		>=dev-python/pytest-github-actions-annotate-failures-0.2.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-picked-0.5.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-socket-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-sugar-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeout-2.3.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-unordered-0.6.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-3.6.1[${PYTHON_USEDEP}]
		>=dev-python/requests-mock-1.12.1[${PYTHON_USEDEP}]
		>=dev-python/respx-0.21.1[${PYTHON_USEDEP}]
		>=dev-python/ruff-0.7.1[${PYTHON_USEDEP}]
		>=dev-python/syrupy-4.7.2[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66.5[${PYTHON_USEDEP}]
		>=dev-python/types-aiofiles-24.1.0.20240626[${PYTHON_USEDEP}]
		>=dev-python/types-atomicwrites-1.4.5.1[${PYTHON_USEDEP}]
		>=dev-python/types-beautifulsoup4-4.12.0.20240907[${PYTHON_USEDEP}]
		>=dev-python/types-caldav-1.3.0.20240824[${PYTHON_USEDEP}]
		>=dev-python/types-chardet-0.1.5[${PYTHON_USEDEP}]
		>=dev-python/types-croniter-2.0.0.20240423[${PYTHON_USEDEP}]
		>=dev-python/types-decorator-5.1.8.20240310[${PYTHON_USEDEP}]
		>=dev-python/types-paho-mqtt-1.6.0.20240321[${PYTHON_USEDEP}]
		>=dev-python/types-pillow-10.2.0.20240822[${PYTHON_USEDEP}]
		>=dev-python/types-protobuf-5.28.0.20240924[${PYTHON_USEDEP}]
		>=dev-python/types-psutil-6.0.0.20240901[${PYTHON_USEDEP}]
		>=dev-python/types-python-dateutil-2.9.0.20241003[${PYTHON_USEDEP}]
		>=dev-python/types-python-slugify-8.0.2.20240310[${PYTHON_USEDEP}]
		>=dev-python/types-pytz-2024.2.0.20241003[${PYTHON_USEDEP}]
		>=dev-python/types-PyYAML-6.0.12.20240917[${PYTHON_USEDEP}]
		>=dev-python/types-requests-2.31.0.3[${PYTHON_USEDEP}]
		>=dev-python/types-xmltodict-0.13.0.3[${PYTHON_USEDEP}]
		>=dev-python/yamllint-1.35.1[${PYTHON_USEDEP}]
	)"

src_prepare() {
	if use test ; then
		cp --no-preserve=mode --recursive ${WORKDIR}/core-${MY_PV}/tests ${S}
		chmod u+x ${S}/tests/auth/providers/test_command_line_cmd.sh
	fi
	sed -e "s|aiohttp==3.10.11|aiohttp>=3.10.11|" -i homeassistant/package_constraints.txt || die
	sed -e "s|aiohttp-fast-zlib==0.1.1|aiohttp-fast-zlib>=0.1.1|" -i homeassistant/package_constraints.txt || die
	sed -e "s|aiohttp_cors==0.7.0|aiohttp_cors>=0.7.0|" -i homeassistant/package_constraints.txt || die
	sed -e "s|aiozoneinfo==0.2.1|aiozoneinfo>=0.2.1|" -i homeassistant/package_constraints.txt || die
	sed -e "s|astral==2.2|astral>=2.2|" -i homeassistant/package_constraints.txt || die
	sed -e "s|async-interrupt==1.2.0|async-interrupt>=1.2.0|" -i homeassistant/package_constraints.txt || die
	sed -e "s|atomicwrites-homeassistant==1.4.1|atomicwrites-homeassistant>=1.4.1|" -i homeassistant/package_constraints.txt || die
	sed -e "s|attrs==24.2.0|attrs>=24.2.0|" -i homeassistant/package_constraints.txt || die
	sed -e "s|awesomeversion==24.6.0|awesomeversion>=24.6.0|" -i homeassistant/package_constraints.txt || die
	sed -e "s|bcrypt==4.2.0|bcrypt>=4.2.0|" -i homeassistant/package_constraints.txt || die
	sed -e "s|ciso8601==2.3.1|ciso8601>=2.3.1|" -i homeassistant/package_constraints.txt || die
	sed -e "s|cryptography==43.0.1|cryptography>=43.0.1|" -i homeassistant/package_constraints.txt || die
	sed -e "s|home-assistant-bluetooth==1.13.0|home-assistant-bluetooth>=1.13.0|" -i homeassistant/package_constraints.txt || die
	sed -e "s|httpx==0.27.2|httpx>=0.27.2|" -i homeassistant/package_constraints.txt || die
	sed -e "s|Jinja2==3.1.4|Jinja2>=3.1.4|" -i homeassistant/package_constraints.txt || die
	sed -e "s|lru-dict==1.3.0|lru-dict>=1.3.0|" -i homeassistant/package_constraints.txt || die
	sed -e "s|orjson==3.10.10|orjson>=3.10.10|" -i homeassistant/package_constraints.txt || die
	sed -e "s|propcache==0.2.0|propcache>=0.2.0|" -i homeassistant/package_constraints.txt || die
	sed -e "s|pydantic==1.10.18|pydantic>=1.10.18|" -i homeassistant/package_constraints.txt || die
	sed -e "s|python-slugify==8.0.4|python-slugify>=8.0.4|" -i homeassistant/package_constraints.txt || die
	sed -e "s|PyYAML==6.0.2|PyYAML>=6.0.2|" -i homeassistant/package_constraints.txt || die
	sed -e "s|requests==2.32.3|requests>=2.32.3|" -i homeassistant/package_constraints.txt || die
	sed -e "s|ulid-transform==1.0.2|ulid-transform>=1.0.2|" -i homeassistant/package_constraints.txt || die
	sed -e "s|uv==0.4.28|uv>=0.4.28|" -i homeassistant/package_constraints.txt || die
	sed -e "s|voluptuous==0.15.2|voluptuous>=0.15.2|" -i homeassistant/package_constraints.txt || die
	sed -e "s|voluptuous-openapi==0.0.5|voluptuous-openapi>=0.0.5|" -i homeassistant/package_constraints.txt || die
	sed -e "s|voluptuous-serialize==2.6.0|voluptuous-serialize>=2.6.0|" -i homeassistant/package_constraints.txt || die
	sed -e "s|webrtc-models==0.2.0|webrtc-models>=0.2.0|" -i homeassistant/package_constraints.txt || die
	sed -e "s|yarl==1.17.1|yarl>=1.17.1|" -i homeassistant/package_constraints.txt || die

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

# Copyright 1999-2025 Gentoo Authors
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
IUSE="bh1750 blinkt bme280 bme680 cli coronavirus deutsche_bahn dht http loopenergy mariadb mosquitto mysql smarthab socat somfy ssl systemd tesla wink  abode acaia accuweather acer_projector acmeda adax adguard ads advantage_air aemet aftership agent_dvr airgradient airly airnow airq airthings_ble airthings airtouch4 airtouch5 airvisual airvisual_pro airzone_cloud airzone alarmdecoder alpha_vantage amazon_polly amberelectric ambient_network ambient_station amcrest ampio analytics_insights android_ip_webcam androidtv androidtv_remote anel_pwrctrl anova anthemav anthropic aosmith apache_kafka apcupsd apple_tv apprise aprilaire aprs apsystems aquacell aqualogic aquostv aranet arcam_fmj arris_tg2492lg aruba arve aseko_pool_live assist_pipeline asuswrt atag aten_pe atome august aurora_abb_powerone aurora aussie_broadband autarco avea avion awair aws axis azure_data_explorer azure_devops azure_event_hub azure_service_bus azure_storage backup baf baidu balboa bang_olufsen bbox beewi_smartclim bitcoin bizkaibus blackbird blebox blink blockchain blue_current bluemaestro bluesound bluetooth bluetooth_tracker bmw_connected_drive bond bosch_alarm bosch_shc braviatv bring broadlink brother brottsplatskartan brunt bryant_evolution bsblan bt_home_hub_5 bthome bt_smarthub buienradar caldav cambridge_audio camera canary cast ccm15 chacon_dio channels cisco_ios cisco_mobility_express cisco_webex_teams clementine cloudflare cloud cmus co2signal coinbase color_extractor comelit comfoconnect command_line compensation concord232 control4 conversation cookidoo coolmaster cppm_tracker cpuspeed crownstone cups daikin danfoss_air datadog deako debugpy deconz decora decora_wifi delijn deluge denonavr devialet devolo_home_control devolo_home_network dexcom dhcp digital_ocean directv discogs discord discovergy dlib_face_detect dlib_face_identify dlink dlna_dmr dlna_dms dnsip dominos doods doorbird dormakaba_dkey dremel_3d_printer drop_connect dsmr duke_energy dunehd duotecno dwd_weather_warnings dweet dynalite eafm easyenergy ebox ebusd ecoal_boiler ecobee ecoforest econet ecovacs ecowitt eddystone_temperature edimax edl21 efergy egardia eheimdigital electrasmart electric_kiwi elevenlabs elgato eliqonline elkm1 elmax elvia elv emby emoncms emonitor emulated_kasa emulated_roku energenie_power_sockets energyzero enigma2 enocean enphase_envoy entur_public_transport environment_canada envisalink ephember epic_games_store epion epson eq3btsmart escea esphome etherscan eufylife_ble eufy everlights evil_genius_labs evohome ezviz faa_delays familyhub fastdotcom feedreader ffmpeg fibaro fido file fints fireservicerota firmata fitbit fivem fixer fjaraskupan fleetgo flexit_bacnet flick_electric flic flipr flo flume flux_led folder_watcher foobot forecast_solar forked_daapd fortios foscam freebox freedompro free_mobile fritzbox_callmonitor fritzbox fritz fronius frontend frontier_silicon fujitsu_fglair fully_kiosk futurenow fyta garages_amsterdam gardena_bluetooth gc100 gdacs generic geniushub geocaching geo_json_events geonetnz_quakes geonetnz_volcano geo_rss_events gios github gitlab_ci gitter glances go2rtc goalzero gogogate2 goodwe google_assistant_sdk google_cloud google_drive google_generative_ai_conversation google_mail google google_maps google_photos google_pubsub google_sheets google_tasks google_translate google_travel_time govee_ble govee_light_local gpsd gree greeneye_monitor greenwave growatt_server gstreamer gtfs guardian habitica hardware harman_kardon_avr harmony hassio hdmi_cec heatmiser heos here_travel_time hikvisioncam hikvision hisense_aehw4a1 hive hko hlk_sw16 holiday homeassistant_hardware home_connect homee homekit_controller homekit homematicip_cloud homematic homewizard homeworks honeywell horizon hp_ilo html5 huawei_lte hue huisbaasje hunterdouglas_powerview husqvarna_automower_ble husqvarna_automower huum hvv_departures hydrawise hyperion ialarm iammeter iaqualink ibeacon icloud idasen_desk idteck_prox ifttt iglo igloohome ign_sismologia ihc image_upload imap imgw_pib improv_ble incomfort influxdb inkbird insteon intellifire intesishome iometer iotawatt iotty iperf3 ipma ipp iqvia irish_rail_transport iron_os isal iskra islamic_prayer_times israel_rail iss ista_ecotrend isy994 itach ituran izone jellyfin jewish_calendar joaoapps_join juicenet justnimbus jvc_projector kaiterra kaleidescape keba keenetic_ndms2 kef kegtron keyboard keyboard_remote keymitt_ble kira kiwi kmtronic knocki knx kodi konnected kostal_plenticore kraken kulersky kwb lacrosse lacrosse_view lamarzocco lametric landisgyr_heat_meter lastfm launch_library laundrify lcn ld2410_ble leaone led_ble lektrico letpot lg_netcast lg_soundbar lg_thinq lidarr lifx lightwave limitlessled linear_garage_door linkplay linode linux_battery lirc litejet litterrobot livisi local_calendar local_todo london_underground lookin loqed luci luftdaten lupusec lutron_caseta lutron lw12wifi lyric madvr mailgun marytts mastodon matrix matter maxcube mcp mcp_server mealie meater medcom_ble media_extractor mediaroom melcloud melissa melnor message_bird met_eireann meteoalarm meteoclimatic meteo_france met metoffice mfi microbees microsoft mikrotik mill minecraft_server minio moat mobile_app mochad modbus modem_callerid modern_forms moehlenhoff_alpha2 monarch_money monoprice monzo mopeka motionblinds_ble motion_blinds motioneye motionmount mpd mqtt msteams mullvad music_assistant mutesync mysensors mystrom mythicbeastsdns myuplink nad namecheapdns nam nanoleaf nasweb neato nederlandse_spoorwegen ness_alarm nest netatmo netdata netgear_lte netgear netio network neurio_energy nexia nextbus nextcloud nextdns nfandroidtv nibe_heatpump nice_go nightscout niko_home_control nilu nina nissan_leaf nmap_tracker nmbs noaa_tides nobo_hub nordpool norway_air notify_events notion nsw_fuel_station nsw_rural_fire_service_feed nuheat nuki numato nut nws nx584 nyt_games nzbget oasa_telematics obihai octoprint oem ohmconnect ohme ollama ombi omnilogic oncue ondilo_ico onedrive onewire onkyo onvif openai_conversation openerz openevse openexchangerates opengarage openhome open_meteo opensensemap opensky opentherm_gw openuv openweathermap opnsense opower opple oralb oru orvibo osoenergy osramlightify otbr otp ourgroceries overkiz overseerr ovo_energy owntracks p1_monitor palazzetti panasonic_bluray panasonic_viera pandora peblar peco pegel_online pencom permobil pglab philips_js picnic pi_hole pilight ping pjlink plaato plex plugwise plum_lightpad pocketcasts point poolsense powerfox powerwall private_ble_device profiler progettihwsw proliphix prometheus prosegur proxmoxve proxy prusalink ps4 pterodactyl pulseaudio_loopback pure_energie purpleair pushbullet pushover pvoutput pvpc_hourly_pricing pyload python_script qbittorrent qbus qingping qld_bushfire qnap qnap_qsw qrcode quantum_gateway qvr_pro qwikswitch rabbitair rachio radarr radio_browser radiotherm rainbird raincloud rainforest_eagle rainforest_raven rainmachine rapt_ble raspyrfm rdw recollect_waste recorder recswitch reddit refoss rejseplanen remember_the_milk remote_calendar remote_rpi_gpio renault renson reolink repetier rest rflink rfxtrx ridwell ring ripple risco rituals_perfume_genie rmvtransport roborock rocketchat roku romy roomba roon route53 rova rpi_power ruckus_unleashed russound_rio russound_rnet ruuvi_gateway ruuvitag_ble rympro sabnzbd saj samsungtv sanix satel_integra schlage schluter scrape screenlogic scsgate season sendgrid sense sensibo sensirion_ble sensorpro sensorpush_cloud sensorpush sensoterra sentry senz serial serial_pm sesame seven_segments seventeentrack sfr_box sharkiq shelly shodan sia sighthound signal_messenger simplefin simplepush simplisafe sinch sisyphus skybeacon skybell sky_hub sky_remote slack sleepiq slide_local slide slimproto sma smappee smart_meter_texas smartthings smarttub smarty smhi smlight sms snapcast snmp snoo snooz solaredge_local solaredge solarlog solax soma somfy_mylink sonarr songpal sonos sony_projector soundtouch spc speedtestdotnet splunk spotify sql squeezebox srp_energy ssdp starline starlingbank starlink startca statsd steamist steam_online stiebel_eltron stookwijzer streamlabswater stream subaru suez_water supla surepetcare swiss_hydrological_data swiss_public_transport switchbee switchbot_cloud switchbot switcher_kis switchmate syncthing syncthru synology_dsm synology_srm system_bridge systemmonitor tado tailscale tailwind tami4 tankerkoenig tank_utility tapsaff tasmota tautulli technove ted5000 tedee telegram_bot tellduslive tellstick temper tensorflow tesla_fleet tesla_wall_connector teslemetry tessie thermobeacon thermopro thethingsnetwork thingspeak thinkingcleaner thread tibber tikteck tile tilt_ble tmb todoist tolo tomorrowio toon totalconnect touchline touchline_sl tplink_lte tplink tplink_omada traccar traccar_server tractive tradfri trafikverket_camera trafikverket_ferry trafikverket_train trafikverket_weatherstation transmission transport_nsw travisci trend triggercmd tts tuya twentemilieu twilio twinkly twitch twitter ubus ukraine_alarm unifi_direct unifiled unifi unifiprotect upb upc_connect upcloud upnp uptimerobot usb usgs_earthquakes_feed utility_meter uvc v2c vallox vasttrafik velbus velux venstar vera verisure versasense version vesync vicare vilfo vivotek vizio vlc vlc_telnet vodafone_station voip volkszaehler volumio volvooncall vulcan vultr w800rf32 wake_on_lan wallbox waqi waterfurnace watergate watson_iot watttime waze_travel_time weatherflow_cloud weatherflow weatherkit webdav webmin webostv weheat wemo whirlpool whois wiffi wilight wirelesstag withings wiz wled wmspro wolflink workday ws66i wyoming xbox xeoma xiaomi_aqara xiaomi_ble xiaomi_miio xiaomi_tv xmpp xs1 yale yale_smart_alarm yalexs_ble yamaha yamaha_musiccast yandex_transport yardian yeelight yeelightsunflower yi yolink youless youtube zabbix zamg zeroconf zerproc zestimate zeversolar zha zhong_hong ziggo_mediabox_xl zoneminder zwave_js zwave_me"
RESTRICT="!test? ( test )"

# external deps
RDEPEND="${PYTHON_DEPS} acct-group/${MY_PN} acct-user/${MY_PN}
	|| ( dev-lang/python:3.12 dev-lang/python:3.13 )
	app-admin/logrotate
	dev-db/sqlite
	dev-libs/libfastjson
	dev-libs/xerces-c"
REQUIRED_USE="bluetooth? ( ruuvi_gateway shelly )
	homekit_controller? ( bluetooth )"
# Home Assistant Core dependencies from ./homeassistant-2025.4.1/homeassistant/package_constraints.txt
RDEPEND="${RDEPEND}

	~dev-python/aiodhcpwatcher-1.1.1[${PYTHON_USEDEP}]
	~dev-python/aiodiscover-2.6.1[${PYTHON_USEDEP}]
	~dev-python/aiodns-3.2.0[${PYTHON_USEDEP}]
	~dev-python/aiohasupervisor-0.3.0[${PYTHON_USEDEP}]
	~dev-python/aiohttp-asyncmdnsresolver-0.1.1[${PYTHON_USEDEP}]
	~dev-python/aiohttp-fast-zlib-0.2.3[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.11.16[${PYTHON_USEDEP}]
	~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	~dev-python/aiousbwatcher-1.1.1[${PYTHON_USEDEP}]
	~dev-python/aiozoneinfo-0.2.3[${PYTHON_USEDEP}]
	~dev-python/annotatedyaml-0.4.5[${PYTHON_USEDEP}]
	~dev-python/astral-2.2[${PYTHON_USEDEP}]
	~dev-python/async-interrupt-1.2.2[${PYTHON_USEDEP}]
	~dev-python/async-upnp-client-0.44.0[${PYTHON_USEDEP}]
	~dev-python/atomicwrites-1.4.1[${PYTHON_USEDEP}]
	~dev-python/attrs-25.1.0[${PYTHON_USEDEP}]
	~dev-python/audioop-lts-0.2.1[${PYTHON_USEDEP}]
	~dev-python/av-13.1.0[${PYTHON_USEDEP}]
	~dev-python/awesomeversion-24.6.0[${PYTHON_USEDEP}]
	~dev-python/bcrypt-4.2.0[${PYTHON_USEDEP}]
	~dev-python/bleak-retry-connector-3.9.0[${PYTHON_USEDEP}]
	~dev-python/bleak-0.22.3[${PYTHON_USEDEP}]
	~dev-python/bluetooth-adapters-0.21.4[${PYTHON_USEDEP}]
	~dev-python/bluetooth-auto-recovery-1.4.5[${PYTHON_USEDEP}]
	~dev-python/bluetooth-data-tools-1.26.5[${PYTHON_USEDEP}]
	~dev-python/cached-ipaddress-0.10.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2021.5.30[${PYTHON_USEDEP}]
	~dev-python/ciso8601-2.3.2[${PYTHON_USEDEP}]
	~dev-python/cronsim-2.6[${PYTHON_USEDEP}]
	~dev-python/cryptography-44.0.1[${PYTHON_USEDEP}]
	~dev-python/dbus-fast-2.43.0[${PYTHON_USEDEP}]
	~dev-python/fnv-hash-fast-1.4.0[${PYTHON_USEDEP}]
	~dev-python/go2rtc-client-0.1.2[${PYTHON_USEDEP}]
	~dev-python/ha-ffmpeg-3.2.2[${PYTHON_USEDEP}]
	~dev-python/habluetooth-3.37.0[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.94.0[${PYTHON_USEDEP}]
	~dev-python/hassil-2.2.3[${PYTHON_USEDEP}]
	~dev-python/home-assistant-bluetooth-1.13.1[${PYTHON_USEDEP}]
	~dev-python/home-assistant-frontend-20250404.0[${PYTHON_USEDEP}]
	~dev-python/home-assistant-intents-2025.3.28[${PYTHON_USEDEP}]
	~dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	~dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
	~dev-python/jinja2-3.1.6[${PYTHON_USEDEP}]
	~dev-python/lru-dict-1.3.0[${PYTHON_USEDEP}]
	~media-libs/mutagen-1.47.0[${PYTHON_USEDEP}]
	~dev-python/numpy-2.2.2[${PYTHON_USEDEP}]
	~dev-python/orjson-3.10.16[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.1[${PYTHON_USEDEP}]
	~dev-python/paho-mqtt-2.1.0[${PYTHON_USEDEP}]
	~dev-python/pillow-11.1.0[${PYTHON_USEDEP}]
	~dev-python/propcache-0.3.0[${PYTHON_USEDEP}]
	~dev-python/psutil-home-assistant-0.0.1[${PYTHON_USEDEP}]
	~dev-python/pyjwt-2.10.1[${PYTHON_USEDEP}]
	~dev-python/pymicro-vad-1.0.1[${PYTHON_USEDEP}]
	~dev-python/pynacl-1.5.0[${PYTHON_USEDEP}]
	~dev-python/pyopenssl-25.0.0[${PYTHON_USEDEP}]
	~dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	~dev-python/pyspeex-noise-1.0.2[${PYTHON_USEDEP}]
	~dev-python/python-slugify-8.0.4[${PYTHON_USEDEP}]
	~dev-python/PyTurboJPEG-1.7.5[${PYTHON_USEDEP}]
	~dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
	~dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	~dev-python/securetar-2025.2.1[${PYTHON_USEDEP}]
	~dev-python/sqlalchemy-2.0.39[${PYTHON_USEDEP}]
	~dev-python/standard-aifc-3.13.0[${PYTHON_USEDEP}]
	~dev-python/standard-telnetlib-3.13.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.13.0[${PYTHON_USEDEP}]
	~dev-python/ulid-transform-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.5[${PYTHON_USEDEP}]
  >=dev-python/uv-0.6.10

	~dev-python/voluptuous-openapi-0.0.6[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.6.0[${PYTHON_USEDEP}]
	~dev-python/voluptuous-0.15.2[${PYTHON_USEDEP}]
	~dev-python/webrtc-models-0.3.0[${PYTHON_USEDEP}]
	~dev-python/yarl-1.18.3[${PYTHON_USEDEP}]
	~dev-python/zeroconf-0.146.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.6.6[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.19.0[${PYTHON_USEDEP}]
	~dev-python/grpcio-1.67.1[${PYTHON_USEDEP}]
	~dev-python/grpcio-status-1.67.1[${PYTHON_USEDEP}]
	~dev-python/grpcio-reflection-1.67.1[${PYTHON_USEDEP}]
	>=dev-python/btlewrap-0.0.10[${PYTHON_USEDEP}]
	~dev-python/anyio-4.9.0[${PYTHON_USEDEP}]
	~dev-python/h11-0.14.0[${PYTHON_USEDEP}]
	~dev-python/httpcore-1.0.7[${PYTHON_USEDEP}]
	>=dev-python/hyperframe-5.2.0[${PYTHON_USEDEP}]
	~dev-python/numpy-2.2.2[${PYTHON_USEDEP}]
	~dev-python/pandas-2.2.3[${PYTHON_USEDEP}]
	>=dev-python/multidict-6.0.2[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.0[${PYTHON_USEDEP}]
	~dev-python/pydantic-2.10.6[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13.1[${PYTHON_USEDEP}]
	!=dev-python/pubnub-6.4.0[${PYTHON_USEDEP}]
	!=dev-python/iso4217-1.10.20220401[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-24.0.0[${PYTHON_USEDEP}]
	~dev-python/protobuf-5.29.2[${PYTHON_USEDEP}]
	>=dev-python/faust-cchardet-2.1.18[${PYTHON_USEDEP}]
	>=dev-python/websockets-13.1[${PYTHON_USEDEP}]
	dev-python/poetry
	~dev-python/charset-normalizer-3.4.0[${PYTHON_USEDEP}]
	>=dev-python/dacite-1.7.0[${PYTHON_USEDEP}]
	>=dev-python/chacha20poly1305-reuseable-0.13.0[${PYTHON_USEDEP}]
	>=dev-python/pycountry-23.12.11[${PYTHON_USEDEP}]
	>=net-analyzer/scapy-2.6.1[${PYTHON_USEDEP}]
	>=dev-python/tuf-4.0.0[${PYTHON_USEDEP}]
	!=dev-python/tenacity-8.4.0[${PYTHON_USEDEP}]
	~dev-python/async-timeout-4.0.3[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]"
# Home Assistant Core dependencies from ./core-2025.4.1/homeassistant/package_constraints.txt
RDEPEND="${RDEPEND}

	~dev-python/aiodhcpwatcher-1.1.1[${PYTHON_USEDEP}]
	~dev-python/aiodiscover-2.6.1[${PYTHON_USEDEP}]
	~dev-python/aiodns-3.2.0[${PYTHON_USEDEP}]
	~dev-python/aiohasupervisor-0.3.0[${PYTHON_USEDEP}]
	~dev-python/aiohttp-asyncmdnsresolver-0.1.1[${PYTHON_USEDEP}]
	~dev-python/aiohttp-fast-zlib-0.2.3[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.11.16[${PYTHON_USEDEP}]
	~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	~dev-python/aiousbwatcher-1.1.1[${PYTHON_USEDEP}]
	~dev-python/aiozoneinfo-0.2.3[${PYTHON_USEDEP}]
	~dev-python/annotatedyaml-0.4.5[${PYTHON_USEDEP}]
	~dev-python/astral-2.2[${PYTHON_USEDEP}]
	~dev-python/async-interrupt-1.2.2[${PYTHON_USEDEP}]
	~dev-python/async-upnp-client-0.44.0[${PYTHON_USEDEP}]
	~dev-python/atomicwrites-1.4.1[${PYTHON_USEDEP}]
	~dev-python/attrs-25.1.0[${PYTHON_USEDEP}]
	~dev-python/audioop-lts-0.2.1[${PYTHON_USEDEP}]
	~dev-python/av-13.1.0[${PYTHON_USEDEP}]
	~dev-python/awesomeversion-24.6.0[${PYTHON_USEDEP}]
	~dev-python/bcrypt-4.2.0[${PYTHON_USEDEP}]
	~dev-python/bleak-retry-connector-3.9.0[${PYTHON_USEDEP}]
	~dev-python/bleak-0.22.3[${PYTHON_USEDEP}]
	~dev-python/bluetooth-adapters-0.21.4[${PYTHON_USEDEP}]
	~dev-python/bluetooth-auto-recovery-1.4.5[${PYTHON_USEDEP}]
	~dev-python/bluetooth-data-tools-1.26.5[${PYTHON_USEDEP}]
	~dev-python/cached-ipaddress-0.10.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2021.5.30[${PYTHON_USEDEP}]
	~dev-python/ciso8601-2.3.2[${PYTHON_USEDEP}]
	~dev-python/cronsim-2.6[${PYTHON_USEDEP}]
	~dev-python/cryptography-44.0.1[${PYTHON_USEDEP}]
	~dev-python/dbus-fast-2.43.0[${PYTHON_USEDEP}]
	~dev-python/fnv-hash-fast-1.4.0[${PYTHON_USEDEP}]
	~dev-python/go2rtc-client-0.1.2[${PYTHON_USEDEP}]
	~dev-python/ha-ffmpeg-3.2.2[${PYTHON_USEDEP}]
	~dev-python/habluetooth-3.37.0[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.94.0[${PYTHON_USEDEP}]
	~dev-python/hassil-2.2.3[${PYTHON_USEDEP}]
	~dev-python/home-assistant-bluetooth-1.13.1[${PYTHON_USEDEP}]
	~dev-python/home-assistant-frontend-20250404.0[${PYTHON_USEDEP}]
	~dev-python/home-assistant-intents-2025.3.28[${PYTHON_USEDEP}]
	~dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	~dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
	~dev-python/jinja2-3.1.6[${PYTHON_USEDEP}]
	~dev-python/lru-dict-1.3.0[${PYTHON_USEDEP}]
	~media-libs/mutagen-1.47.0[${PYTHON_USEDEP}]
	~dev-python/numpy-2.2.2[${PYTHON_USEDEP}]
	~dev-python/orjson-3.10.16[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.1[${PYTHON_USEDEP}]
	~dev-python/paho-mqtt-2.1.0[${PYTHON_USEDEP}]
	~dev-python/pillow-11.1.0[${PYTHON_USEDEP}]
	~dev-python/propcache-0.3.0[${PYTHON_USEDEP}]
	~dev-python/psutil-home-assistant-0.0.1[${PYTHON_USEDEP}]
	~dev-python/pyjwt-2.10.1[${PYTHON_USEDEP}]
	~dev-python/pymicro-vad-1.0.1[${PYTHON_USEDEP}]
	~dev-python/pynacl-1.5.0[${PYTHON_USEDEP}]
	~dev-python/pyopenssl-25.0.0[${PYTHON_USEDEP}]
	~dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	~dev-python/pyspeex-noise-1.0.2[${PYTHON_USEDEP}]
	~dev-python/python-slugify-8.0.4[${PYTHON_USEDEP}]
	~dev-python/PyTurboJPEG-1.7.5[${PYTHON_USEDEP}]
	~dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
	~dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	~dev-python/securetar-2025.2.1[${PYTHON_USEDEP}]
	~dev-python/sqlalchemy-2.0.39[${PYTHON_USEDEP}]
	~dev-python/standard-aifc-3.13.0[${PYTHON_USEDEP}]
	~dev-python/standard-telnetlib-3.13.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.13.0[${PYTHON_USEDEP}]
	~dev-python/ulid-transform-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.5[${PYTHON_USEDEP}]
  >=dev-python/uv-0.6.10

	~dev-python/voluptuous-openapi-0.0.6[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.6.0[${PYTHON_USEDEP}]
	~dev-python/voluptuous-0.15.2[${PYTHON_USEDEP}]
	~dev-python/webrtc-models-0.3.0[${PYTHON_USEDEP}]
	~dev-python/yarl-1.18.3[${PYTHON_USEDEP}]
	~dev-python/zeroconf-0.146.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.6.6[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.19.0[${PYTHON_USEDEP}]
	~dev-python/grpcio-1.67.1[${PYTHON_USEDEP}]
	~dev-python/grpcio-status-1.67.1[${PYTHON_USEDEP}]
	~dev-python/grpcio-reflection-1.67.1[${PYTHON_USEDEP}]
	>=dev-python/btlewrap-0.0.10[${PYTHON_USEDEP}]
	~dev-python/anyio-4.9.0[${PYTHON_USEDEP}]
	~dev-python/h11-0.14.0[${PYTHON_USEDEP}]
	~dev-python/httpcore-1.0.7[${PYTHON_USEDEP}]
	>=dev-python/hyperframe-5.2.0[${PYTHON_USEDEP}]
	~dev-python/numpy-2.2.2[${PYTHON_USEDEP}]
	~dev-python/pandas-2.2.3[${PYTHON_USEDEP}]
	>=dev-python/multidict-6.0.2[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.0[${PYTHON_USEDEP}]
	~dev-python/pydantic-2.10.6[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13.1[${PYTHON_USEDEP}]
	!=dev-python/pubnub-6.4.0[${PYTHON_USEDEP}]
	!=dev-python/iso4217-1.10.20220401[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-24.0.0[${PYTHON_USEDEP}]
	~dev-python/protobuf-5.29.2[${PYTHON_USEDEP}]
	>=dev-python/faust-cchardet-2.1.18[${PYTHON_USEDEP}]
	>=dev-python/websockets-13.1[${PYTHON_USEDEP}]
	dev-python/poetry
	~dev-python/charset-normalizer-3.4.0[${PYTHON_USEDEP}]
	>=dev-python/dacite-1.7.0[${PYTHON_USEDEP}]
	>=dev-python/chacha20poly1305-reuseable-0.13.0[${PYTHON_USEDEP}]
	>=dev-python/pycountry-23.12.11[${PYTHON_USEDEP}]
	>=net-analyzer/scapy-2.6.1[${PYTHON_USEDEP}]
	>=dev-python/tuf-4.0.0[${PYTHON_USEDEP}]
	!=dev-python/tenacity-8.4.0[${PYTHON_USEDEP}]
	~dev-python/async-timeout-4.0.3[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]"

# unknown origin, still something to clean up here

RDEPEND="${RDEPEND}
	~dev-python/colorlog-6.8.2[${PYTHON_USEDEP}]
	~dev-python/pyotp-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}]"

# Module requirements from useflags
RDEPEND="${RDEPEND}
	bh1750? ( dev-python/i2csense[${PYTHON_USEDEP}] )
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
		cp --no-preserve=mode --recursive "${WORKDIR}/core-${MY_PV}/tests" "${S}"
		chmod u+x "${S}/tests/auth/providers/test_command_line_cmd.sh"
    fi
    sed -E -i "s/regex==[^ ]*/regex/g" -i "homeassistant/package_constraints.txt" || die

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

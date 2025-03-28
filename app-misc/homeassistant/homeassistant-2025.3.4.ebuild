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
 3_day_blinds abode acaia accuweather acer_projector acmeda acomax actiontec adax adguard ads aemet aep_ohio aep_texas aftership agent_dvr airgradient airly airnow airq air_quality airthings_ble airthings airtouch4 airtouch5 airvisual airvisual_pro airzone_cloud airzone alarm_control_panel alarmdecoder alert alexa alpha_vantage amazon_polly amberelectric ambient_network ambient_station amcrest ampio amp_motorization analytics_insights analytics android_ip_webcam androidtv androidtv_remote anel_pwrctrl anova anthemav anthropic anwb_energie aosmith apache_kafka api apollo_automation appalachianpower apple_tv application_credentials apprise aprilaire aprs aps apsystems aquacell aqualogic aquostv aranet arcam_fmj arest arris_tg2492lg artsound aruba arve arwn aseko_pool_live assist_pipeline assist_satellite asuswrt atag aten_pe atlanticcityelectric atome august_ble august aurora_abb_powerone aurora aussie_broadband autarco auth automation avea avion awair aws axis azure_data_explorer azure_devops azure_event_hub azure_service_bus azure_storage backup baf baidu balboa bang_olufsen bayesian bbox beewi_smartclim bge binary_sensor bitcoin bizkaibus blackbird blebox blink blinksticklight bliss_automation bloc_blinds blockchain blue_current bluemaestro blueprint bluesound bluetooth_adapters bluetooth_le_tracker bluetooth bluetooth_tracker bmw_connected_drive bond bosch_shc brandt braviatv brel_home bring broadlink brother brottsplatskartan browser brunt bryant_evolution bsblan bswitch bt_home_hub_5 bthome bticino bt_smarthub bubendorff buienradar burbank_water_and_power button caldav calendar cambridge_audio camera canary cast ccm15 cert_expiry chacon_dio channels cisco_ios cisco_mobility_express cisco_webex_teams citybikes clementine clickatell clicksend clicksend_tts climate cloudflare cloud cmus co2signal coautilities coinbase color_extractor comed_hourly_pricing comed comelit comfoconnect command_line compensation concord232 coned config configurator control4 conversation cookidoo coolmaster counter cover cozytouch cppm_tracker cpuspeed cribl crownstone cups currencylayer dacia daikin danfoss_air datadog date datetime ddwrt deako debugpy deconz decora decora_wifi decorquip default_config delijn delmarva deluge demo denonavr denon derivative devialet device_sun_light_trigger device_tracker devolo_home_control devolo_home_network dexcom dhcp diagnostics dialogflow diaz digital_loggers digital_ocean directv discogs discord discovergy dlib_face_detect dlib_face_identify dlink dlna_dmr dlna_dms dnsip dominos doods doorbird dooya dormakaba_dkey dovado downloader dremel_3d_printer drop_connect dsmr dsmr_reader dublin_bus_transport duckdns duke_energy dunehd duotecno duquesne_light dwd_weather_warnings dweet dynalite eafm eastron easyenergy ebox ebusd ecoal_boiler ecobee ecoforest econet ecovacs ecowitt eddystone_temperature edimax edl21 efergy egardia eheimdigital electrasmart electric_kiwi elevenlabs elgato eliqonline elkm1 elmax elvia elv emby emoncms_history emoncms emonitor emulated_hue emulated_kasa emulated_roku energenie_power_sockets energie_vanons energy energyzero enigma2 enmax enocean enphase_envoy entur_public_transport environment_canada envisalink ephember epic_games_store epion epson eq3btsmart escea esera_onewire esphome etherscan eufylife_ble eufy event evergy everlights evil_genius_labs evohome ezviz faa_delays facebook fail2ban familyhub fan fastdotcom feedreader ffmpeg ffmpeg_motion ffmpeg_noise fibaro fido file filesize file_upload filter fints fireservicerota fire_tv firmata fitbit fivem fixer fjaraskupan fleetgo flexit_bacnet flexit flexom flick_electric flic flipr flock flo flume flux_led flux folder folder_watcher foobot forecast_solar forked_daapd fortios foscam foursquare freebox freedns freedompro free_mobile fritzbox_callmonitor fritzbox fritz fronius frontend frontier_silicon fujitsu_anywair fujitsu_fglair fully_kiosk futurenow fyta garadget garages_amsterdam gardena_bluetooth gaviota gc100 gdacs generic_hygrostat generic generic_thermostat geniushub geocaching geofency geo_json_events geo_location geonetnz_quakes geonetnz_volcano geo_rss_events gios github gitlab_ci gitter glances go2rtc goalzero gogogate2 goodwe google_assistant google_assistant_sdk google_cloud google_drive google_generative_ai_conversation google_mail google google_maps google_photos google_pubsub google_sheets google_tasks google_translate google_travel_time google_wifi govee_ble govee_light_local gpsd gpslogger graphite gree greeneye_monitor greenwave group growatt_server gstreamer gtfs guardian habitica hardware harman_kardon_avr harmony harvey hassio havana_shade haveibeenpwned hddtemp hdmi_cec heatmiser heicko heiwa heos here_travel_time hexaom hi_kumo hikvisioncam hikvision hisense_aehw4a1 history history_stats hitron_coda hive hko hlk_sw16 holiday homeassistant_alerts homeassistant_green homeassistant_hardware homeassistant homeassistant_sky_connect homeassistant_yellow home_connect homee homekit_controller homekit homematicip_cloud homematic home_plus_control homewizard homeworks honeywell horizon hp_ilo html5 http huawei_lte hue huisbaasje humidifier hunterdouglas_powerview hurrican_shutters_wholesale husqvarna_automower_ble husqvarna_automower huum hvv_departures hydrawise hyperion ialarm iammeter iaqualink ibeacon icloud idasen_desk idteck_prox ifttt iglo igloohome ign_sismologia ihc image image_processing image_upload imap imgw_pib improv_ble incomfort indianamichiganpower influxdb inkbird input_boolean input_button input_datetime input_number input_select input_text inspired_shades insteon integration intellifire intent_script intesishome iometer ios iotawatt iotty iperf3 ipma ipp iqvia irish_rail_transport iron_os isal iskra islamic_prayer_times ismartwindow israel_rail iss ista_ecotrend isy994 itach itunes ituran izone jellyfin jewish_calendar joaoapps_join juicenet justnimbus jvc_projector kaiterra kaleidescape kankun keba keenetic_ndms2 kef kegtron kentuckypower keyboard keyboard_remote keymitt_ble kira kitchen_sink kiwi kmtronic knocki knx kodi konnected kostal_plenticore kraken krispol kulersky kwb lacrosse lacrosse_view lamarzocco lametric landisgyr_heat_meter lannouncer lastfm launch_library laundrify lawn_mower lcn ld2410_ble leaone led_ble legrand lektrico letpot lg_netcast lg_soundbar lg_thinq lidarr lifx_cloud lifx light lightwave limitlessled linak linear_garage_door linkplay linksys_smart linode linux_battery linx lirc litejet litterrobot livisi llamalab_automate local_calendar local_file local_ip local_todo locative lock logbook logentries logger london_air london_underground lookin loqed luci luftdaten lupusec lutron_caseta lutron luxaflex lw12wifi lyric madeco madvr mailgun manual manual_mqtt marantz martec marytts mastodon matrix matter maxcube mcp mcp_server mealie meater medcom_ble media_extractor media_player mediaroom media_source melcloud melissa melnor meraki mercury_nz message_bird met_eireann meteoalarm meteoclimatic meteo_france met metoffice mfi microbees microsoft_face_detect microsoft_face_identify microsoft_face microsoft mijndomein_energie mikrotik mill minecraft_server mini_connected minio min_max mjpeg moat mobile_app mochad modbus modem_callerid modern_forms moehlenhoff_alpha2 mold_indicator monarch_money monessen monoprice monzo moon mopeka motionblinds_ble motion_blinds motioneye motionmount mpd mqtt_eventstream mqtt_json mqtt mqtt_room mqtt_statestream msteams mullvad music_assistant mutesync mvglive mycroft my mysensors mystrom mythicbeastsdns myuplink nad namecheapdns nam nanoleaf nasweb neato nederlandse_spoorwegen ness_alarm nest netatmo netdata netgear_lte netgear netio network neurio_energy nexia nexity nextbus nextcloud nextdns nfandroidtv nibe_heatpump nice_go nightscout niko_home_control nilu nina nissan_leaf nmap_tracker nmbs noaa_tides nobo_hub no_ip nordpool norway_air notify_events notify notion nsw_fuel_station nsw_rural_fire_service_feed nuheat nuki numato number nut nutrichef nws nx584 nyt_games nzbget oasa_telematics obihai octoprint oem ohmconnect ohme ollama ombi omnilogic onboarding oncue ondilo_ico onedrive onewire onkyo onvif openai_conversation openalpr_cloud openerz openevse openexchangerates opengarage openhardwaremonitor openhome open_meteo opensensemap opensky opentherm_gw openuv openweathermap opnsense opower opple oralb oru oru_opower orvibo osoenergy osramlightify otbr otp ourgroceries overkiz overseerr ovo_energy owntracks p1_monitor palazzetti panasonic_bluray panasonic_viera pandora panel_custom pcs_lighting peblar peco peco_opower pegel_online pencom pepco permobil persistent_notification person pge pglab philips_js picnic picotts pi_hole pilight pinecil ping pioneer piper pjlink plaato plant plex plugwise plum_lightpad pocketcasts point poolsense portlandgeneral powerfox powerwall private_ble_device profiler progettihwsw proliphix prometheus prosegur prowl proximity proxmoxve proxy prusalink ps4 pse psoklahoma pulseaudio_loopback pure_energie purpleair pushbullet push pushover pushsafer pvoutput pvpc_hourly_pricing pyload python_script qbittorrent qbus qingping qld_bushfire qnap qnap_qsw qrcode quadrafire quantum_gateway qvr_pro qwikswitch rabbitair rachio radarr radio_browser radiotherm rainbird raincloud rainforest_eagle rainforest_raven rainmachine random rapt_ble raspyrfm raven_rock_mfg rdw recollect_waste recorder recovery_mode recswitch reddit refoss rejseplanen remember_the_milk remote remote_rpi_gpio renault renson reolink repairs repetier rest_command rest rexel rflink rfxtrx rhasspy ridwell ring ripple risco rituals_perfume_genie rmvtransport roborock rocketchat roku romy roomba roon route53 rova rpi_camera rpi_power rss_feed_template rtorrent ruckus_unleashed russound_rio russound_rnet ruuvi_gateway ruuvitag_ble rympro sabnzbd saj samsam samsungtv sanix satel_integra scene schedule schlage schluter scl scrape screenaway screenlogic script scsgate search season select sendgrid sense sensibo sensirion_ble sensorblue sensor sensorpro sensorpush_cloud sensorpush sensoterra sentry senz serial serial_pm sesame seven_segments seventeentrack sfr_box sharkiq shell_command shelly shodan shopping_list sia sigfox sighthound signal_messenger simplefin simplepush simplisafe simply_automated simu sinch siren sisyphus skybeacon skybell sky_hub sky_remote slack sleepiq slide_local slide slimproto sma smappee smart_blinds smarther smart_home smart_meter_texas smart_rollos smartthings smarttub smarty smhi smlight sms smtp smud snapcast snips snmp snoo snooz solaredge_local solaredge solarlog solax soma somfy somfy_mylink sonarr songpal sonos sony_projector soundtouch spaceapi spc speedtestdotnet splunk spotify sql squeezebox srp_energy ssdp starline starlingbank starlink startca statistics statsd steamist steam_online stiebel_eltron stookwijzer streamlabswater stream stt subaru suez_water sun sunweg supervisord supla surepetcare swepco swisscom swiss_hydrological_data swiss_public_transport switch_as_x switchbee switchbot_cloud switchbot switcher_kis switch switchmate symfonisk syncthing syncthru synology_chat synology_dsm synology_srm syslog system_bridge system_health system_log systemmonitor tado tag tailscale tailwind tami4 tankerkoenig tank_utility tapsaff tasmota tautulli tcp technove ted5000 tedee telegram_bot telegram tellduslive tellstick telnet temper template tensorflow tesla_fleet tesla_wall_connector teslemetry tessie text tfiac thermobeacon thermoplus thermopro thermoworks_smoke thethingsnetwork thingspeak thinkingcleaner thomson thread threshold tibber tikteck tile tilt_ble time_date time timer tmb tod todoist todo tolo tomato tomorrowio toon torque totalconnect touchline touchline_sl tplink_lte tplink tplink_omada tplink_tapo traccar traccar_server tractive tradfri trafikverket_camera trafikverket_ferry trafikverket_train trafikverket_weatherstation transmission transport_nsw travisci trend triggercmd tts tuya twentemilieu twilio_call twilio twilio_sms twinkly twitch twitter ubiwizz ublockout ubus ukraine_alarm uk_transport ultraloq unifi_direct unifiled unifi unifiprotect universal upb upc_connect upcloud update upnp uprise_smart_shades uptime uptimerobot usb usgs_earthquakes_feed utility_meter uvc v2c vacuum vallox valve vasttrafik velbus velux venstar vera verisure vermont_castings versasense version vesync viaggiatreno vicare vilfo vivotek vizio vlc vlc_telnet vodafone_station voicerss voip volkszaehler volumio volvooncall vulcan vultr w800rf32 wake_on_lan wake_word wallbox waqi waterfurnace watergate water_heater watson_iot watson_tts watttime waze_travel_time weatherflow_cloud weatherflow weatherkit weather webdav webhook webmin webostv websocket_api weheat wemo whirlpool whisper whois wiffi wilight wirelesstag withings wiz wled wmspro wolflink workday worldclock worldtidesinfo worxlandroid ws66i wsdot wyoming x10 xbox xeoma xiaomi_aqara xiaomi_ble xiaomi xiaomi_miio xiaomi_tv xmpp xs1 yale_home yale yale_smart_alarm yalexs_ble yamaha yamaha_musiccast yandex_transport yandextts yardian yeelight yeelightsunflower yi yolink youless youtube zabbix zamg zengge zeroconf zerproc zestimate zeversolar zha zhong_hong ziggo_mediabox_xl zodiac zondergas zone zoneminder zwave_js zwave_me"
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
# Home Assistant Core dependencies from ./homeassistant-2025.3.4/homeassistant/package_constraints.txt
RDEPEND="${RDEPEND}

	~dev-python/aiodhcpwatcher-1.1.1[${PYTHON_USEDEP}]
	~dev-python/aiodiscover-2.6.1[${PYTHON_USEDEP}]
	~dev-python/aiodns-3.2.0[${PYTHON_USEDEP}]
	~dev-python/aiohasupervisor-0.3.0[${PYTHON_USEDEP}]
	~dev-python/aiohttp-asyncmdnsresolver-0.1.1[${PYTHON_USEDEP}]
	~dev-python/aiohttp-fast-zlib-0.2.3[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.11.13[${PYTHON_USEDEP}]
	~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	~dev-python/aiousbwatcher-1.1.1[${PYTHON_USEDEP}]
	~dev-python/aiozoneinfo-0.2.3[${PYTHON_USEDEP}]
	~dev-python/astral-2.2[${PYTHON_USEDEP}]
	~dev-python/async-interrupt-1.2.2[${PYTHON_USEDEP}]
	~dev-python/async-upnp-client-0.43.0[${PYTHON_USEDEP}]
	~dev-python/atomicwrites-1.4.1[${PYTHON_USEDEP}]
	~dev-python/attrs-25.1.0[${PYTHON_USEDEP}]
	~dev-python/audioop-lts-0.2.1[${PYTHON_USEDEP}]
	~dev-python/av-13.1.0[${PYTHON_USEDEP}]
	~dev-python/awesomeversion-24.6.0[${PYTHON_USEDEP}]
	~dev-python/bcrypt-4.2.0[${PYTHON_USEDEP}]
	~dev-python/bleak-retry-connector-3.9.0[${PYTHON_USEDEP}]
	~dev-python/bleak-0.22.3[${PYTHON_USEDEP}]
	~dev-python/bluetooth-adapters-0.21.4[${PYTHON_USEDEP}]
	~dev-python/bluetooth-auto-recovery-1.4.4[${PYTHON_USEDEP}]
	~dev-python/bluetooth-data-tools-1.23.4[${PYTHON_USEDEP}]
	~dev-python/cached-ipaddress-0.9.2[${PYTHON_USEDEP}]
	>=dev-python/certifi-2021.5.30[${PYTHON_USEDEP}]
	~dev-python/ciso8601-2.3.2[${PYTHON_USEDEP}]
	~dev-python/cronsim-2.6[${PYTHON_USEDEP}]
	~dev-python/cryptography-44.0.1[${PYTHON_USEDEP}]
	~dev-python/dbus-fast-2.33.0[${PYTHON_USEDEP}]
	~dev-python/fnv-hash-fast-1.2.6[${PYTHON_USEDEP}]
	~dev-python/go2rtc-client-0.1.2[${PYTHON_USEDEP}]
	~dev-python/ha-ffmpeg-3.2.2[${PYTHON_USEDEP}]
	~dev-python/habluetooth-3.24.1[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.92.0[${PYTHON_USEDEP}]
	~dev-python/hassil-2.2.3[${PYTHON_USEDEP}]
	~dev-python/home-assistant-bluetooth-1.13.1[${PYTHON_USEDEP}]
	~dev-python/home-assistant-frontend-20250306.0[${PYTHON_USEDEP}]
	~dev-python/home-assistant-intents-2025.3.5[${PYTHON_USEDEP}]
	~dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	~dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
	~dev-python/jinja2-3.1.6[${PYTHON_USEDEP}]
	~dev-python/lru-dict-1.3.0[${PYTHON_USEDEP}]
	~media-libs/mutagen-1.47.0[${PYTHON_USEDEP}]
	~dev-python/orjson-3.10.12[${PYTHON_USEDEP}]
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
	~dev-python/sqlalchemy-2.0.38[${PYTHON_USEDEP}]
	~dev-python/standard-aifc-3.13.0[${PYTHON_USEDEP}]
	~dev-python/standard-telnetlib-3.13.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
	~dev-python/ulid-transform-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.5[${PYTHON_USEDEP}]  >=dev-python/uv-0.6.1

	~dev-python/voluptuous-openapi-0.0.6[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.6.0[${PYTHON_USEDEP}]
	~dev-python/voluptuous-0.15.2[${PYTHON_USEDEP}]
	~dev-python/webrtc-models-0.3.0[${PYTHON_USEDEP}]
	~dev-python/yarl-1.18.3[${PYTHON_USEDEP}]
	~dev-python/zeroconf-0.145.1[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.6.6[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.19.0[${PYTHON_USEDEP}]
	~dev-python/grpcio-1.67.1[${PYTHON_USEDEP}]
	~dev-python/grpcio-status-1.67.1[${PYTHON_USEDEP}]
	~dev-python/grpcio-reflection-1.67.1[${PYTHON_USEDEP}]
	>=dev-python/btlewrap-0.0.10[${PYTHON_USEDEP}]
	~dev-python/anyio-4.8.0[${PYTHON_USEDEP}]
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
# Home Assistant Core dependencies from ./core-2025.3.4/homeassistant/package_constraints.txt
RDEPEND="${RDEPEND}

	~dev-python/aiodhcpwatcher-1.1.1[${PYTHON_USEDEP}]
	~dev-python/aiodiscover-2.6.1[${PYTHON_USEDEP}]
	~dev-python/aiodns-3.2.0[${PYTHON_USEDEP}]
	~dev-python/aiohasupervisor-0.3.0[${PYTHON_USEDEP}]
	~dev-python/aiohttp-asyncmdnsresolver-0.1.1[${PYTHON_USEDEP}]
	~dev-python/aiohttp-fast-zlib-0.2.3[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.11.13[${PYTHON_USEDEP}]
	~dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	~dev-python/aiousbwatcher-1.1.1[${PYTHON_USEDEP}]
	~dev-python/aiozoneinfo-0.2.3[${PYTHON_USEDEP}]
	~dev-python/astral-2.2[${PYTHON_USEDEP}]
	~dev-python/async-interrupt-1.2.2[${PYTHON_USEDEP}]
	~dev-python/async-upnp-client-0.43.0[${PYTHON_USEDEP}]
	~dev-python/atomicwrites-1.4.1[${PYTHON_USEDEP}]
	~dev-python/attrs-25.1.0[${PYTHON_USEDEP}]
	~dev-python/audioop-lts-0.2.1[${PYTHON_USEDEP}]
	~dev-python/av-13.1.0[${PYTHON_USEDEP}]
	~dev-python/awesomeversion-24.6.0[${PYTHON_USEDEP}]
	~dev-python/bcrypt-4.2.0[${PYTHON_USEDEP}]
	~dev-python/bleak-retry-connector-3.9.0[${PYTHON_USEDEP}]
	~dev-python/bleak-0.22.3[${PYTHON_USEDEP}]
	~dev-python/bluetooth-adapters-0.21.4[${PYTHON_USEDEP}]
	~dev-python/bluetooth-auto-recovery-1.4.4[${PYTHON_USEDEP}]
	~dev-python/bluetooth-data-tools-1.23.4[${PYTHON_USEDEP}]
	~dev-python/cached-ipaddress-0.9.2[${PYTHON_USEDEP}]
	>=dev-python/certifi-2021.5.30[${PYTHON_USEDEP}]
	~dev-python/ciso8601-2.3.2[${PYTHON_USEDEP}]
	~dev-python/cronsim-2.6[${PYTHON_USEDEP}]
	~dev-python/cryptography-44.0.1[${PYTHON_USEDEP}]
	~dev-python/dbus-fast-2.33.0[${PYTHON_USEDEP}]
	~dev-python/fnv-hash-fast-1.2.6[${PYTHON_USEDEP}]
	~dev-python/go2rtc-client-0.1.2[${PYTHON_USEDEP}]
	~dev-python/ha-ffmpeg-3.2.2[${PYTHON_USEDEP}]
	~dev-python/habluetooth-3.24.1[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.92.0[${PYTHON_USEDEP}]
	~dev-python/hassil-2.2.3[${PYTHON_USEDEP}]
	~dev-python/home-assistant-bluetooth-1.13.1[${PYTHON_USEDEP}]
	~dev-python/home-assistant-frontend-20250306.0[${PYTHON_USEDEP}]
	~dev-python/home-assistant-intents-2025.3.5[${PYTHON_USEDEP}]
	~dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	~dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
	~dev-python/jinja2-3.1.6[${PYTHON_USEDEP}]
	~dev-python/lru-dict-1.3.0[${PYTHON_USEDEP}]
	~media-libs/mutagen-1.47.0[${PYTHON_USEDEP}]
	~dev-python/orjson-3.10.12[${PYTHON_USEDEP}]
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
	~dev-python/sqlalchemy-2.0.38[${PYTHON_USEDEP}]
	~dev-python/standard-aifc-3.13.0[${PYTHON_USEDEP}]
	~dev-python/standard-telnetlib-3.13.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
	~dev-python/ulid-transform-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.5[${PYTHON_USEDEP}]  >=dev-python/uv-0.6.1

	~dev-python/voluptuous-openapi-0.0.6[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.6.0[${PYTHON_USEDEP}]
	~dev-python/voluptuous-0.15.2[${PYTHON_USEDEP}]
	~dev-python/webrtc-models-0.3.0[${PYTHON_USEDEP}]
	~dev-python/yarl-1.18.3[${PYTHON_USEDEP}]
	~dev-python/zeroconf-0.145.1[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.6.6[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.19.0[${PYTHON_USEDEP}]
	~dev-python/grpcio-1.67.1[${PYTHON_USEDEP}]
	~dev-python/grpcio-status-1.67.1[${PYTHON_USEDEP}]
	~dev-python/grpcio-reflection-1.67.1[${PYTHON_USEDEP}]
	>=dev-python/btlewrap-0.0.10[${PYTHON_USEDEP}]
	~dev-python/anyio-4.8.0[${PYTHON_USEDEP}]
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

#!/bin/bash
eix-update

parse_constraints () {
    local f="$1"
    echo "# Home Assistant Core dependencies from $f" >> $EBUILD_PATH
    echo "RDEPEND=\"\${RDEPEND}" >> $EBUILD_PATH
    for l in `cat $f | grep '^[^#]' | cut -d, -f1`; do
        OIFS="$IFS"
        IFS='<>=!'
        for d in  $l; do
	    echo -ne "                                                                                          \r \e[0;32m*\e[0m Parsing main dependencies... $d"
	    local pos=${#d}
	    local package=`eix -es# $d --use python_targets_python3_12`
            local operator=${l:$pos:2}
            pos=$((pos + 2 ))
            local version=${l:$pos}
            if [ -z "$package" ];then
	    	package=`eix -es# ${d,,} --use python_targets_python3_12`
	    fi
            if [ -z "$package" ];then
                package=`eix -es# ${d//_/-} --use python_targets_python3_12`
            fi
	    case $d in
	    	atomicwrites-homeassistant)
	    		package="dev-python/atomicwrites"
			;;
			faust-cchardet)
	            package="dev-python/cchardet"
			;;
			uv)
	            echo "	>=dev-python/uv-$version" >> $EBUILD_PATH
				break
			;;
        	Jinja2)
                package="dev-python/jinja"
			;;
	    esac
	    if [ -z "$package" ];then
	      echo -e ": \e[1;33m$l corresponding gentoo package was not found, entry skipped\e[0m"
	      break
	    fi
	    if [ "$version" = "1000000000.0.0" ]; then
	    	echo "        $package[\${PYTHON_USEDEP}]" >> $EBUILD_PATH
	        break
	    fi
	    case $operator in
	    	==)
                  echo "	~$package-$version[\${PYTHON_USEDEP}]" >> $EBUILD_PATH
		  ;;
		*)
		  echo "	$operator$package-$version[\${PYTHON_USEDEP}]" >> $EBUILD_PATH
            esac
            break
        done
        IFS="$OIFS"
    done
    echo "\"" >> $EBUILD_PATH

}

# get latest
if [ -z "$1" ];then
    VERSION=`curl -s https://api.github.com/repos/home-assistant/core/releases/latest | jq '.tag_name' | xargs -I {} echo {}`
else
    VERSION=`curl -s https://api.github.com/repos/home-assistant/core/releases/tags/${1/_beta/b} | jq '.tag_name' | xargs -I {} echo {}`
fi
EBUILD=$( pwd | rev | cut -d/ -f1 | rev )-${VERSION/b/_beta}
EBUILD_PATH=$( pwd )/$EBUILD.ebuild

if [ -f "$EBUILD_PATH" ]; then
    echo -e "  \e[0;31m$EBUILD already exists, \e[0m"
    ebuild $EBUILD_PATH clean unpack
else
    for v in `ls -rv *.ebuild | grep -v 999.ebuild`; do
        cp $v $EBUILD_PATH
        break
    done
    ebuild $EBUILD_PATH clean digest unpack
    patch=$( pwd )/files/genebuild_${VERSION/b/_beta}.patch

fi

pushd /var/tmp/portage/app-misc/${EBUILD}/work

if [ -f "$patch" ]; then
    patch -p1 < $patch
fi

cat > $EBUILD_PATH << EOF
# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_12 )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="homeassistant"
inherit distutils-r1 pypi readme.gentoo-r1 systemd

MY_PN=homeassistant

if [[ \${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/home-assistant/core.git"
	EGIT_BRANCH="dev"
	S="\${WORKDIR}/homeassistant-full-9999/"
else
	MY_PV=\${PV/_beta/b}
	MY_P=\${MY_PN}-\${MY_PV}
	SRC_URI="\$(pypi_sdist_url homeassistant)
	https://github.com/home-assistant/core/archive/\${MY_PV}.tar.gz -> \${MY_P}.gh.tar.gz"
fi

DESCRIPTION="Open-source home automation platform running on Python."
HOMEPAGE="https://home-assistant.io/ https://git.edevau.net/onkelbeh/HomeAssistantRepository/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="abode accuweather acer_projector acmeda adax adguard ads advantage_air aemet aftership agent_dvr airgradient airly airnow airq airthings airtouch4 airtouch5 airvisual airvisual_pro airzone airzone_cloud alarmdecoder alpha_vantage amazon_polly ambee amberelectric ambiclimate ambient_network ambient_station amcrest ampio analytics_insights androidtv androidtv_remote android_ip_webcam anova anthemav aosmith apache_kafka apcupsd apns apple_tv apprise aprilaire aprs apsystems aqualogic aquostv aranet arcam_fmj arlo arris_tg2492lg aruba arve aseko_pool_live assist_pipeline asterisk_mbox asuswrt atag aten_pe atome august aurora aurora_abb_powerone aussie_broadband avea avion awair aws axis azure_data_explorer +backup baf baidu balboa bang_olufsen bbb_gpio bbox beewi_smartclim bh1750 bitcoin bizkaibus blackbird blebox blink blinksticklight blinkt blockchain bluemaestro bluesound +bluetooth bluetooth_le_tracker bluetooth_tracker blue_current bme280 bme680 bmp280 bmw_connected_drive bond bosch_shc braviatv bring broadlink brottsplatskartan brunt bsblan bthome bt_home_hub_5 bt_smarthub buienradar +caldav camera canary cast ccm15 channels circuit cisco_ios cisco_mobility_express clementine cli climacell cloud cloudflare cmus co2signal coinbase color_extractor comelit comfoconnect compensation concord232 control4 coolmaster coronavirus cppm_tracker cpuspeed crownstone cups daikin danfoss_air datadog debugpy deconz decora decora_wifi delijn deluge denonavr deutsche_bahn devialet devolo_home_control devolo_home_network dexcom dhcp dht digitalloggers digital_ocean directv discogs discord discovergy discovery dlib_face_detect dlib_face_identify dlink dlna_dmr dlna_dms dnsip dominos doods doorbird dormakaba_dkey dovado dremel_3d_printer drop_connect dsmr dunehd duotecno dwd_weather_warnings dweet dynalite dyson eafm easyenergy ebox ebusd ecoal_boiler ecobee ecoforest econet ecovacs ecowitt eddystone_temperature edimax edl21 ee_brightbox efergy egardia electrasmart electric_kiwi elgato eliqonline elkm1 elmax elv elvia emby emonitor emulated_hue emulated_kasa emulated_roku energenie_power_sockets energyzero enigma2 enocean enphase_envoy entur_public_transport environment_canada envirophat envisalink ephember epic_games_store epion epson epsonworkforce eq3btsmart escea esphome essent etherscan eufy eufylife_ble everlights evil_genius_labs evohome ezviz faa_delays familyhub fastdotcom feedreader ffmpeg fibaro fido file file_upload fints fireservicerota firmata fitbit fivem fixer fjaraskupan fleetgo flexit flexit_bacnet flic flick_electric flipr flo flume flunearyou flux_led folder_watcher foobot forecast_solar forked_daapd fortios foscam freebox freedompro free_mobile fritz fritzbox fritzbox_callmonitor fronius frontier_silicon fully_kiosk futurenow fyta garages_amsterdam gardena_bluetooth garmin_connect gc100 gdacs generic geniushub geocaching geonetnz_quakes geonetnz_volcano geo_json_events geo_rss_events gios github gitlab_ci gitter glances gntp goalfeed goalzero gogogate2 goodwe google google_assistant_sdk google_cloud google_generative_ai_conversation google_mail google_maps google_pubsub google_sheets google_tasks google_translate google_travel_time govee_ble govee_light_local gpsd gree greeneye_monitor greenwave growatt_server gstreamer gtfs guardian habitica hangouts hardware harman_kardon_avr harmony hdmi_cec heatmiser heos here_travel_time hikvision hikvisioncam hisense_aehw4a1 hive hko hlk_sw16 holiday +homekit homekit_controller homematic homematicip_cloud homewizard homeworks home_connect home_plus_control honeywell horizon hp_ilo html5 http htu21d huawei_lte hue huisbaasje hunterdouglas_powerview husqvarna_automower huum hvv_departures hydrawise hyperion ialarm ialarm_xr iammeter iaqualink ibeacon icloud idasen_desk idteck_prox ifttt iglo ign_sismologia ihc image image_upload imap imgw_pib improv_ble incomfort influxdb inkbird insteon intellifire intesishome iota iotawatt iperf3 ipma ipp iqvia irish_rail_transport isal islamic_prayer_times iss isy994 itach izone jellyfin jewish_calendar joaoapps_join juicenet justnimbus jvc_projector kaiterra kaleidescape keba keenetic_ndms2 kef kegtron keyboard keyboard_remote keymitt_ble kira kiwi kmtronic knx kodi konnected kostal_plenticore kraken kulersky kwb lacrosse lacrosse_view lamarzocco lametric landisgyr_heat_meter lastfm launch_library laundrify lcn ld2410_ble leaone led_ble lg_netcast lg_soundbar lidarr life360 lifx lifx_legacy lightwave limitlessled linear_garage_door linode linux_battery litejet litterrobot livisi local_calendar local_todo logi_circle london_underground lookin loopenergy loqed luci luftdaten lupusec lutron lutron_caseta lw12wifi lyft lyric magicseaweed mailgun +mariadb marytts mastodon matrix +matter maxcube mcp23017 meater medcom_ble mediaroom media_extractor melcloud melissa melnor message_bird met meteoalarm meteoclimatic meteo_france metoffice met_eireann mfi mhz19 microbees microsoft mikrotik mill minecraft_server minio moat +mobile_app mochad modbus modem_callerid modern_forms moehlenhoff_alpha2 monoprice monzo mopeka +mosquitto motionblinds_ble motioneye motionmount motion_blinds mpd +mqtt msteams mullvad mutesync mvglive mychevy mycroft mysensors mysql mystrom mythicbeastsdns myuplink nad nam namecheapdns nanoleaf neato nederlandse_spoorwegen nello ness_alarm nest netatmo netdata netgear netgear_lte netio network neurio_energy nexia nextbus nextcloud nextdns nfandroidtv nibe_heatpump nightscout niko_home_control nilu nina nissan_leaf nmap_tracker nmbs noaa_tides nobo_hub norway_air +notify_events notion nsw_fuel_station nsw_rural_fire_service_feed nuheat nuki numato nut nws nx584 nzbget oasa_telematics obihai octoprint oem ohmconnect ollama ombi omnilogic oncue ondilo_ico onkyo onvif openai_conversation openerz openevse opengarage openhome opensensemap opensky opentherm_gw openuv openweathermap open_meteo opnsense opower opple oralb orangepi_gpio oru orvibo osoenergy osramlightify otbr +otp ourgroceries overkiz ovo_energy owntracks ozw p1_monitor panasonic_bluray panasonic_viera pandora pcal9535a peco pegel_online pencom permobil philips_js picnic piglow pilight +ping pi_hole pjlink plaato +plex plugwise plum_lightpad pocketcasts point poolsense powerwall private_ble_device profiler progettihwsw proliphix prometheus prosegur proxmoxve proxy prusalink ps4 pulseaudio_loopback pure_energie purpleair pushbullet pushover pvoutput pvpc_hourly_pricing +python_script qbittorrent qingping qld_bushfire qnap qnap_qsw qrcode quantum_gateway qvr_pro qwikswitch rabbitair rachio radiotherm radio_browser rainbird raincloud rainforest_eagle rainforest_raven rainmachine rapt_ble raspihats raspyrfm rdw recollect_waste +recorder recswitch reddit refoss rejseplanen remember_the_milk remote_rpi_gpio renault renson reolink repetier +rest rflink rfxtrx ridwell ring ripple risco rituals_perfume_genie rmvtransport rocketchat roku romy roomba roon route53 rova rpi_gpio rpi_gpio_pwm rpi_pfio rpi_power rpi_rf rtsp_to_webrtc ruckus_unleashed russound_rio russound_rnet ruuvitag_ble ruuvi_gateway rympro sabnzbd saj samsungtv sanix satel_integra schlage schluter +scrape screenlogic scsgate season sendgrid sense sensehat senseme sensibo sensirion_ble sensorpro sensorpush sentry senz serial serial_pm sesame seventeentrack seven_segments sfr_box sharkiq shelly shiftr shodan sht31 sia sighthound signal_messenger simplepush simplisafe sinch sisyphus skybeacon skybell sky_hub slack sleepiq slide slimproto sma smappee smarthab smartthings smarttub smarty smart_meter_texas smhi sms snapcast +snmp snooz socat solaredge solaredge_local solarlog solax soma somfy somfy_mylink sonarr songpal sonos sony_projector soundtouch spc speedtestdotnet spider splunk +spotify +sql squeezebox srp_energy ssdp +ssl starline starlingbank starlink startca statsd steamist steam_online stookalert stookwijzer stream streamlabswater subaru suez_water sunweg supla surepetcare swiss_hydrological_data swiss_public_transport switchbee switchbot switchbot_cloud switcher_kis switchmate syncthing syncthru synology_dsm synology_srm systemd systemmonitor system_bridge tado tahoma tailscale tailwind tami4 tankerkoenig tank_utility tapsaff tasmota tautulli technove ted5000 tedee telegram_bot tellduslive tellstick temper tesla tesla_wall_connector teslemetry tessie test tfiac thermobeacon thermopro thermoworks_smoke thingspeak thinkingcleaner thread tibber tikteck tile tilt_ble tmb todoist tof tolo tomorrowio toon totalconnect touchline tplink tplink_lte tplink_omada traccar traccar_server trackr tractive tradfri trafikverket_camera trafikverket_ferry trafikverket_train trafikverket_weatherstation transmission transport_nsw travisci trend tts tuya twentemilieu twilio twinkly twitch twitter ubus ukraine_alarm unifi unifiled unifiprotect unifi_direct upb upcloud upc_connect +upnp uptimerobot usb uscis usgs_earthquakes_feed utility_meter uvc v2c vallox vasttrafik velbus velux venstar vera verisure versasense +version vesync vicare vilfo vivotek vizio vlc vlc_telnet vodafone_station voip volkszaehler volumio volvooncall vulcan vultr w800rf32 +wake_on_lan wallbox waqi waterfurnace watson_iot watson_tts watttime waze_travel_time weatherflow weatherflow_cloud weatherkit webmin webostv wemo whirlpool whois wiffi wilight wink wirelesstag withings wiz wled wolflink workday ws66i xbox xbox_live xeoma xiaomi_aqara xiaomi_ble xiaomi_miio xiaomi_tv xmpp xs1 yalexs_ble yale_smart_alarm yamaha yamaha_musiccast yandex_transport yardian yeelight yeelightsunflower yi yolink youless youtube zabbix zamg zengge zeroconf zerproc zestimate zeversolar zha zhong_hong ziggo_mediabox_xl zoneminder zwave_js zwave_me"
RESTRICT="!test? ( test )"

# external deps
RDEPEND="\${PYTHON_DEPS} acct-group/\${MY_PN} acct-user/\${MY_PN}
	|| ( dev-lang/python:3.12 dev-lang/python:3.13 )
	app-admin/logrotate
	dev-db/sqlite
	dev-libs/libfastjson
	dev-libs/xerces-c"
# make sure no conflicting main Ebuild is installed
RDEPEND="\${RDEPEND}
	!app-misc/homeassistant-min
	!app-misc/homeassistant"
REQUIRED_USE="bluetooth? ( ruuvi_gateway shelly )
	homekit_controller? ( bluetooth )"

EOF
echo -ne " \e[0;32m*\e[0m Parsing main dependencies..."
for i in `find . | grep package_constraints`;do parse_constraints $i; done
echo -e "                                                                                          \r \e[0;32m*\e[0m Parsing main dependencies... \e[0;32mdone\e[0m                                    "
cat >> $EBUILD_PATH <<EOF

# unknown origin, still something to clean up here

RDEPEND="\${RDEPEND}
	~dev-python/colorlog-6.8.2[\${PYTHON_USEDEP}]
	~dev-python/pyotp-2.8.0[\${PYTHON_USEDEP}]
	>=dev-python/pyqrcode-1.2.1[\${PYTHON_USEDEP}]"

# Module requirements from useflags
RDEPEND="\${RDEPEND}
	ambiclimate? ( dev-python/Ambiclimate[\${PYTHON_USEDEP}] )
	bh1750? ( dev-python/i2csense[\${PYTHON_USEDEP}] )
	blinksticklight? ( ~dev-python/BlinkStick-1.2.0[\${PYTHON_USEDEP}] )
	blinkt? ( ~dev-python/blinkt-0.1.0[\${PYTHON_USEDEP}] )
	bme280? ( dev-python/i2csense[\${PYTHON_USEDEP}] dev-python/bme280spi[\${PYTHON_USEDEP}] )
	bme680? ( dev-python/bme680[\${PYTHON_USEDEP}] )
	cli? ( app-misc/home-assistant-cli )
	coronavirus? ( dev-python/coronavirus[\${PYTHON_USEDEP}] )
	deutsche_bahn? ( dev-python/schiene[\${PYTHON_USEDEP}] )
	dht? ( ~dev-python/adafruit-circuitpython-dht-3.7.0[\${PYTHON_USEDEP}] ~dev-python/RPi-GPIO-0.7.1_alpha4[\${PYTHON_USEDEP}] )
	http? ( ~dev-python/aiohttp-cors-0.7.0[\${PYTHON_USEDEP}] ~dev-python/aiohttp-fast-url-dispatcher-0.3.0[\${PYTHON_USEDEP}] ~dev-python/aiohttp-zlib-ng-0.3.1[\${PYTHON_USEDEP}] )
	loopenergy? ( ~dev-python/pyloopenergy-0.2.1[\${PYTHON_USEDEP}] )
	mariadb? ( dev-python/mysqlclient[\${PYTHON_USEDEP}] )
	mosquitto? ( app-misc/mosquitto )
	mysql? ( dev-python/mysqlclient[\${PYTHON_USEDEP}] )
	smarthab? ( ~dev-python/SmartHab-0.21[\${PYTHON_USEDEP}] )
	socat? ( net-misc/socat )
	somfy? ( ~dev-python/pymfy-0.11.0[\${PYTHON_USEDEP}] )
	ssl? ( dev-libs/openssl app-crypt/certbot net-proxy/haproxy )
	tesla? ( ~dev-python/teslajsonpy-0.18.3[\${PYTHON_USEDEP}] )
	wink? ( ~dev-python/pubnubsub-handler-1.0.9[\${PYTHON_USEDEP}] ~dev-python/python-wink-1.10.5[\${PYTHON_USEDEP}] )
EOF
reqall=""
for i in `find ./ | grep requirements_all.txt`; do reqall=$i; break; done
for use in `cat $EBUILD_PATH | grep IUSE= | cut -d\" -f2`; do
    use=${use/+/}
    OLDIFS=$IFS
        IFS="
"
    echo -ne "                                                                                          \r \e[0;32m*\e[0m Parsing use flag dependencies... $use"
    found_dep=
    for req in `cat $reqall | grep -n "^# homeassistant.components.$use$"`; do
    	start_line=`echo $req | cut -d: -f1`
    	start_line=$(( start_line + 1 ))
	found=
	for dep in `tail -n+$start_line $reqall`; do
	    if [ "${dep:0:1}" = "#" ]; then
	        if [ "$found" = "" ]; then
		    continue
		else
        	    break
		fi
            else
		if [ "$found_dep" = "" ]; then
		    echo -n "	$use? (" >> $EBUILD_PATH
		    found_dep="X"
		fi
		dep_package=`eix -es# $( echo "${dep/./-}" | cut -d= -f 1 | cut -d[ -f 1 )  --use python_targets_python3_12`
		if [ -z "$dep_package" ];then
                    dep_package=`eix -es# $( echo "${dep,,}" | cut -d= -f 1 | cut -d[ -f 1 )  --use python_targets_python3_12`
		fi
		if [ -z "$dep_package" ];then
                    dep_package=`eix -es# $( echo "${dep//_/-}" | cut -d= -f 1 | cut -d[ -f 1 )  --use python_targets_python3_12`
                fi
		if [ -z "$dep_package" ];then
		    echo " $req, $dep => $dep_package error"
		fi

		dep_version=`echo "$dep" | cut -d= -f 3`
		dep_use=`echo "$dep" | cut -sd[ -f2 | cut -sd] -f1`
		if [ "$dep_use" = "" ]; then
		    echo -n " ~$dep_package-$dep_version[\${PYTHON_USEDEP}]" >> $EBUILD_PATH
		else
  	            echo -n " ~$dep_package-$dep_version[$dep_use,\${PYTHON_USEDEP}]" >> $EBUILD_PATH
		fi
                found="X"
	    fi
        done
    done
    IFS=$OLDIFS
    if [ "$found_dep" = "" ]; then
    	echo -e ": \e[0;31mno package found\e[0m"
    else
        echo " )">> $EBUILD_PATH
    fi
done
echo "\"" >> $EBUILD_PATH
echo -e "                                                                                          \r \e[0;32m*\e[0m Parsing use flag dependencies... \e[0;32mdone\e[0m                        "
cat >> $EBUILD_PATH <<EOF

BDEPEND="\${RDEPEND}
	test? (
		dev-python/astroid[\${PYTHON_USEDEP}]
		dev-python/coverage[\${PYTHON_USEDEP}]
		dev-python/freezegun[\${PYTHON_USEDEP}]
		dev-python/mock-open[\${PYTHON_USEDEP}]
		dev-python/mypy-dev[\${PYTHON_USEDEP}]
		dev-python/pipdeptree[\${PYTHON_USEDEP}]
		dev-vcs/pre-commit
		dev-python/pylint-per-file-ignores[\${PYTHON_USEDEP}]
		dev-python/pylint[\${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[\${PYTHON_USEDEP}]
		dev-python/pytest-cov[\${PYTHON_USEDEP}]
		dev-python/pytest-freezer[\${PYTHON_USEDEP}]
		dev-python/pytest-github-actions-annotate-failures[\${PYTHON_USEDEP}]
		dev-python/pytest-picked[\${PYTHON_USEDEP}]
		dev-python/pytest-socket[\${PYTHON_USEDEP}]
		dev-python/pytest-sugar[\${PYTHON_USEDEP}]
		dev-python/pytest-timeout[\${PYTHON_USEDEP}]
		dev-python/pytest-unordered[\${PYTHON_USEDEP}]
		dev-python/pytest-xdist[\${PYTHON_USEDEP}]
		dev-python/pytest[\${PYTHON_USEDEP}]
		dev-python/requests-mock[\${PYTHON_USEDEP}]
		dev-python/respx[\${PYTHON_USEDEP}]
		dev-python/syrupy[\${PYTHON_USEDEP}]
		dev-python/tqdm[\${PYTHON_USEDEP}]
	)
	dev-python/setuptools[\${PYTHON_USEDEP}]
	dev-python/mock[\${PYTHON_USEDEP}]"

src_prepare() {
    if use test ; then
        cp --no-preserve=mode --recursive \${WORKDIR}/core-\${MY_PV}/tests \${S}
		chmod u+x \${S}/tests/auth/providers/test_command_line_cmd.sh
    fi
    sed -E -i "s/regex==[^ ]*/regex/g" -i homeassistant/package_constraints.txt || die

    distutils-r1_src_prepare
}
INSTALL_DIR="/opt/\${MY_PN}"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
The HA interface listens on port 8123
hass configuration is in: /etc/\${MY_PN}
daemon command line arguments are configured in: /etc/conf.d/\${MY_PN}
logging is to: /var/log/\${MY_PN}/{server,errors,stdout}.log
The sqlite db is by default in: /etc/\${MY_PN}
support at https://git.edevau.net/onkelbeh/HomeAssistantRepository
"

DOCS="README.rst"

python_install_all() {
	dodoc \${DOCS}
	distutils-r1_python_install_all
	keepdir "\$INSTALL_DIR"
	keepdir "/etc/\${MY_PN}"
	fowners -R "\${MY_PN}:\${MY_PN}" "/etc/\${MY_PN}"
	keepdir "/var/log/\${MY_PN}"
	fowners -R "\${MY_PN}:\${MY_PN}" "/var/log/\${MY_PN}"
	newconfd "\${FILESDIR}/\${MY_PN}.conf.d" "\${MY_PN}"
	newinitd "\${FILESDIR}/\${MY_PN}.init.d" "\${MY_PN}"
	use systemd && systemd_dounit "\${FILESDIR}/\${MY_PN}.service"
	dobin "\${FILESDIR}/hasstest"
	if use socat ; then
		newinitd "\${FILESDIR}/socat-zwave.init.d" "socat-zwave"
		sed -i -e 's/# need socat-zwave/need socat-zwave/g' "\${D}/etc/init.d/\${MY_PN}" || die
	fi
	if use mqtt ; then
		sed -i -e 's/# need mosquitto/need mosquitto/g' "\${D}/etc/init.d/\${MY_PN}" || die
	fi
	insinto /etc/logrotate.d
	newins "\${FILESDIR}/\${MY_PN}.logrotate" "\${MY_PN}"
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}

distutils_enable_tests pytest
EOF

popd
ebuild $EBUILD_PATH clean digest

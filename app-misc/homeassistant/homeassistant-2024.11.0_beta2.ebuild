# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_12 )
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
	SRC_URI="$(pypi_sdist_url)
	https://github.com/home-assistant/core/archive/${MY_PV}.tar.gz -> ${MY_P}.gh.tar.gz"
fi

DESCRIPTION="Open-source home automation platform running on Python."
HOMEPAGE="https://home-assistant.io/ https://git.edevau.net/onkelbeh/HomeAssistantRepository/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="abode accuweather acer_projector acmeda adguard ads aftership agent_dvr airly airvisual aladdin_connect alarmdecoder almond alpha_vantage ambiclimate ambient_station amcrest ampio analytics_insights androidtv androidtv_remote android_ip_webcam anthemav apache_kafka apcupsd apple_tv apprise aquostv arcam_fmj aruba asuswrt aten_pe atome august aurora_abb_powerone avea avion awair axis +backup baidu beewi_smartclim bh1750 bitcoin bizkaibus blackbird blebox blink blinksticklight blinkt blockchain +bluetooth bluetooth_le_tracker bluetooth_tracker bme280 bme680 bmw_connected_drive bond braviatv bring broadlink brottsplatskartan brunt bsblan bt_home_hub_5 bt_smarthub buienradar +caldav camera canary cast cisco_mobility_express cli co2signal compensation coronavirus daikin deconz delijn denonavr deutsche_bahn devolo_home_control dexcom dhcp dht discogs discord discovery dlna_dmr dlna_dms doorbird dunehd dwd_weather_warnings dynalite dyson ecobee ecowitt emulated_roku enigma2 enocean enphase_envoy environment_canada esphome everlights evohome ffmpeg fibaro file flume flunearyou flux_led foobot forecast_solar fortios freebox fritz fritzbox fritzbox_callmonitor fronius garmin_connect gios github glances gogogate2 greeneye_monitor growatt_server guardian harman_kardon_avr harmony heos here_travel_time holiday +homekit homekit_controller homematic homematicip_cloud hp_ilo http hue hydrawise iaqualink ibeacon ihc image_upload imap incomfort influxdb insteon intesishome ipma ipp isal islamic_prayer_times jewish_calendar joaoapps_join kef knx kodi kraken lifx linode litterrobot local_calendar local_todo loopenergy luci luftdaten +mariadb +matter maxcube media_extractor met meteo_france mfi mikrotik +mobile_app modbus +mosquitto +mqtt mysql nad nederlandse_spoorwegen netatmo netdata nextcloud nfandroidtv nmap_tracker +notify_events nuki nut nws nx584 octoprint onkyo onvif opengarage opensensemap openweathermap opnsense +otp owntracks panasonic_viera philips_js pilight +ping pi_hole +plex plugwise poolsense powerwall ps4 +python_script qnap qvr_pro rachio radio_browser rainbird rainmachine +recorder rejseplanen +rest ring roku roomba roon samsungtv +scrape season shelly shodan signal_messenger simplisafe skybell sma smappee smarthab smartthings +snmp socat solax somfy sonos speedtestdotnet +spotify +sql squeezebox +ssl statsd synology_dsm systemd systemmonitor tankerkoenig tasmota tellduslive tesla test tile tomorrowio toon totalconnect tplink tts tuya unifi unifi_direct +upnp usb utility_meter vallox velbus velux vera +version vicare vizio +wake_on_lan waqi waze_travel_time webostv wemo whois wink withings wled workday xbox_live xiaomi_aqara xiaomi_miio xiaomi_tv xs1 yamaha yamaha_musiccast yeelight yi zeroconf zerproc zha zhong_hong zoneminder zwave_js"
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
	!app-misc/homeassistant-full"


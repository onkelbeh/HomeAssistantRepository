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
IUSE="accuweather airly airvisual alpha_vantage androidtv android_ip_webcam axis bluetooth_le_tracker +caldav camera cast cli co2signal compensation coronavirus darksky +dwd_weather_warnings enigma2 esphome forecast_solar fronius +frontend github +homekit homekit_controller http hyperion influxdb knx kodi kraken maxcube mikrotik +mobile_app +mqtt myq mysensors +mysql +notify_events octoprint +otp owntracks -ozw +ping +plex ps4 +python_script qnap qvr_pro +recorder +rest ring samsungtv +scrape season shelly signal_messenger +snmp socat sonos speedtestdotnet +sql +ssl systemd systemmonitor tankerkoenig tasmota test tile tplink tradfri utility_meter +version +wake_on_lan wemo whois workday yamaha yamaha_musiccast zeroconf +zwave_js"

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


# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7,8} )
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

DESCRIPTION="Open-source home automation platform running on Python 3.7 & 3.8"
HOMEPAGE="https://home-assistant.io/ https://git.edevau.net/onkelbeh/HomeAssistantRepository/"

LICENSE="Apache-2.0"
SLOT="0"

KEYWORDS="amd64 arm arm64 x86 amd64-linux x86-linux"
IUSE="androidtv axis +caldav cli coronavirus darksky +dwd_weather_warnings enigma2 esphome fronius github +homekit influxdb kodi maxcube mikrotik +mobile_app +mqtt +mysql +notify_events +otp owntracks +ping +python_script qnap qvr_pro +recorder +rest samsungtv +scrape shelly signal_messenger +snmp socat sonos +sql +ssl systemd tasmota test tradfri +version +wake_on_lan workday yamaha yamaha_musiccast +zwave"

# external deps
RDEPEND="${PYTHON_DEPS} acct-group/${MY_PN} acct-user/${MY_PN}
	|| ( dev-lang/python:3.7 dev-lang/python:3.8 )
	app-admin/logrotate
	dev-db/sqlite
	dev-libs/libfastjson
	>=dev-libs/xerces-c-3.1.4-r1"

# make sure no conflicting main Ebuild is installed
RDEPEND="${RDEPEND}
	!app-misc/homeassistant
	!app-misc/homeassistant-full"


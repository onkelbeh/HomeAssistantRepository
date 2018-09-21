# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3 user

DESCRIPTION="The open Home Automation Bus (openHAB)"
HOMEPAGE="http://www.openhab.org"
SRC_URI=""
EGIT_REPO_URI="https://github.com/openhab/openhab.git"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

IUSE_OPENHAB_ACTION=(
	homematic
	mail
	nma
	openwebif
	prowl
	pushover
	squeezebox
	twitter
	xbmc
	xmpp
	xpl
)
IUSE+=" ${IUSE_OPENHAB_ACTION[@]/#/openhab_action_}"

IUSE_OPENHAB_BINDING=(
	alarmdecoder
	anel
	asterisk
	astro
	benqprojector
	bluetooth
	bticino
	comfoair
	configadmin
	cups
	daikin
	davis
	digitalstrom
	dmx
	dmx_artnet
	dmx_lib485
	dmx_ola
	dscalarm
	ecotouch
	ehealth
	ekey
	em
	energenie
	enigma2
	enocean
	epsonprojector
	exec
	fht
	freebox
	freeswitch
	fritzaha
	fritzbox
	fs20
	gpio
	hdanywhere
	heatmiser
	homematic
	http
	hue
	iec6205621meter
	ihc
	insteonhub
	insteonplm
	intertechno
	irtrans
	jointspace
	k8055
	knx
	koubachi
	lgtv
	maxcube
	maxcul
	milight
	mios
	modbus
	mpd
	mqtt
	mqttitude
	neohub
	netatmo
	networkhealth
	nibeheatpump
	nikobus
	novelanheatpump
	ntp
	oceanic
	omnilink
	onewire
	onkyo
	openenergymonitor
	openpaths
	opensprinkler
	owserver
	piface
	pilight
	pioneeravr
	plcbus
	plugwise
	pulseaudio
	rfxcom
	rme
	s300th
	samsungac
	samsungtv
	serial
	snmp
	sonos
	squeezebox
	swegonventilation
	systeminfo
	tcp
	tellstick
	tinkerforge
	tivo
	urtsi
	vdr
	weather
	wemo
	withings
	wol
	xbmc
	xpl
	yamahareceiver
	zwave
)
IUSE+=" ${IUSE_OPENHAB_BINDING[@]/#/openhab_binding_}"

IUSE_OPENHAB_IO=(
	cv
	dropbox
	gcal
	gpio
	multimedia_tts_freetts
	multimedia_tts_macintalk
	multimedia_tts_marytts
	multimedia_tts_speechdispatcher
	squeezeserver
	transport_cul
	transport_xpl
)
IUSE+=" ${IUSE_OPENHAB_IO[@]/#/openhab_io_}"

IUSE_OPENHAB_PERSISTENCE=(
	cosm
	db4o
	exec
	gcal
	influxdb
	jpa
	logging
	mongodb
	mqtt
	mysql
	rrd4j
	sense
)
IUSE+=" ${IUSE_OPENHAB_PERSISTENCE[@]/#/openhab_persistence_}"

DEPEND="dev-java/maven-bin
	app-arch/unzip
	>=virtual/jdk-1.7"

RDEPEND=">=virtual/jre-1.7"

OPENHAB_HOME="/opt/openhab"

install_openhab_component() {
	local component_type=$1
	shift
	local use_flags=("$@")
	for use_flag in ${use_flags[@]}; do
		use_flag=openhab_${component_type}_${use_flag}
		if ! use $use_flag; then
			continue
		fi
		local component_dir=org.${use_flag//_/.}
		local component_path=$(ls bundles/${component_type}/${component_dir}/target/*.jar)
		doins $component_path
	done
}

pkg_setup() {
	enewgroup openhab
	enewuser oipenhab -1 -1 $OPENHAB_HOME
}

src_compile() {
	mvn install
}

src_install() {
	dodir $OPENHAB_HOME
	unzip $(ls distribution/target/distribution-*-runtime.zip) -d "${ED}/${OPENHAB_HOME}" || die
	# TODO fix server (and subdirectories) permissions being 777

	insinto "${OPENHAB_HOME}/addons"
	install_openhab_component action "${IUSE_OPENHAB_ACTION[@]}"
	install_openhab_component binding "${IUSE_OPENHAB_BINDING[@]}"
	install_openhab_component io "${IUSE_OPENHAB_IO[@]}"
	install_openhab_component persistence "${IUSE_OPENHAB_PERSISTENCE[@]}"
	newinitd "${FILESDIR}/openhab.initd" openhab
	newconfd "${FILESDIR}/openhab.confd" openhab
}

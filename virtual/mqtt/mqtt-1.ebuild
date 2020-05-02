# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Virtual for Home Assistant MQTT"
SLOT="0"
KEYWORDS="amd64 arm64 x86 amd64-linux x86-linux"

RDEPEND="app-misc/mosquitto
	dev-python/hbmqtt"

#RDEPEND="|| (
#	app-misc/mosquitto
#	dev-python/hbmqtt
#)"

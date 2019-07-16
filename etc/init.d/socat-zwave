#!/sbin/openrc-run
# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# socat pty,link=/dev/ttyUSB0,raw,user=homeassistant,group=dialout,mode=777 tcp:172.16.3.199:3333
description="Tunnel to MS3 for making a Z-wave Socket"

user="root:root"

stdoutlog="/var/log/homeassistant/socat.log"

start_stop_daemon_args="--user $user --stdout $stdoutlog"

command="/usr/bin/socat"
command_args="
	pty,link=/dev/ttyUSB0,raw,user=homeassistant,group=dialout,mode=777
	tcp:172.16.3.199:3333
"

command_background=yes
pidfile=/run/socat-zwave.pid

depend() {
    need net
    after bootmisc
}

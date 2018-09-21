#!/sbin/openrc-run
# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

description="Open-source home automation platform"

user="homeassistant:homeassistant"

stdoutlog="/var/log/homeassistant/stdout.log"
serverlog="/var/log/homeassistant/server.log"
warningslog="/var/log/homeassistant/warnings.log"

start_stop_daemon_args="--user $user --stdout $stdoutlog --stderr $serverlog --retry 10"

command="/opt/homeassistant/bin/hass"
command_args="
	--config /etc/homeassistant
	--log-file $warningslog
	--log-rotate-days 9
        ${HASS_OPTS}
"

command_background=yes
pidfile=/run/homeassistant.pid

depend() {
    need net
    after bootmisc
}

start_pre() {
    checkpath --file --owner $user --mode 0644 $stdoutlog
    checkpath --file --owner $user --mode 0644 $serverlog
    checkpath --file --owner $user --mode 0644 $warningslog
}

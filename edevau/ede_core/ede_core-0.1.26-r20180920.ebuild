# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/ssh/ssh-0.ebuild,v 1.5 2014/03/31 20:31:02 ulm Exp $

EAPI=5
inherit eutils

DESCRIPTION="Alle generell immer benoetigten Pakete"
SLOT="0"
KEYWORDS="amd64"
#RESTRICT="bindist"
MERGE_TYPE="source"

DEPEND=""
DEPEND="$(
if [ -x /usr/sbin/lspci ]; then
        ( /usr/sbin/lspci | /bin/grep -qi vmware ) && echo "app-emulation/open-vm-tools"
fi
)"

DEPEND="${DEPEND}
	app-admin/eclean-kernel
        app-admin/logrotate
        app-admin/restart-services
        app-admin/rsyslog
        app-admin/sudo
	app-admin/sysstat
	app-arch/lz4
	app-arch/lzop
	app-arch/rar
	app-arch/unrar
	app-backup/burp
	app-benchmarks/bonnie++
	app-editors/emacs
	app-editors/joe
	app-editors/nano
	app-editors/vim
        app-misc/mc
        app-misc/screen
        app-portage/eix
        app-portage/euses
        app-portage/gentoolkit
        app-shells/bash-completion
        app-shells/gentoo-bashcomp
	app-text/dos2unix
	app-text/multitail
	dev-perl/Monitoring-Plugin
        dev-perl/Switch
	dev-util/strace
	dev-vcs/git
        mail-client/mailx
        mail-mta/postfix
	mail-filter/procmail
	net-analyzer/bing
	net-analyzer/monitoring-plugins
        net-analyzer/mtr
        net-analyzer/nagios-check_glsa2
        net-analyzer/netcat
        net-analyzer/net-snmp
        net-analyzer/nmap
        net-analyzer/tcpdump
        net-analyzer/traceroute
	net-analyzer/traceroute-nanog
        net-dns/bind-tools
        net-fs/nfs-utils
        net-ftp/ftp
        net-ftp/ncftp
	net-mail/pflogsumm
        net-misc/iperf:3
	net-misc/iperf:2
        net-misc/ntp
	net-misc/openssh
        net-misc/socat
	net-misc/telnet-bsd
        net-misc/whois
        sys-apps/ethtool
        sys-apps/haveged
        sys-apps/hdparm
        sys-apps/hwinfo
        sys-apps/iproute2
        sys-apps/mlocate
        sys-apps/pciutils
        sys-apps/pv
        sys-apps/rescan-scsi-bus
        sys-apps/usbutils
	sys-apps/smartmontools
        sys-block/parted
        sys-boot/grub
	sys-devel/gcc
        sys-fs/btrfs-progs
        sys-fs/dmraid
	sys-fs/mdadm
        sys-fs/lvm2
        sys-fs/xfsprogs
	sys-libs/glibc
	sys-kernel/genkernel
        edevau/kernel
        sys-process/at
        sys-process/cronie
        sys-process/iotop
        sys-process/lsof
        virtual/emacs
        virtual/mailx
        "

src_unpack() {
        mkdir -pv "${S}"
        }
src_install() {
        cd "${D}/"
        tar -xaf "${FILESDIR}/${P}.tar.xz"
        }

pkg_postinst()
{
        if [ -x /usr/sbin/lspci ]; then
                ( /usr/sbin/lspci | /bin/grep -qi vmware ) && ( /sbin/rc-update add vmware-tools default; /etc/init.d/vmware-tools restart )
        fi

        #/sbin/rc-update add fw default
        #/etc/init.d/fw stop
        #/etc/init.d/fw start
        /etc/init.d/atd restart

        /sbin/rc-update add postfix default
        /sbin/rc-update add sshd default
        /sbin/rc-update add named default
        /sbin/rc-update add ntpd default
        /sbin/rc-update add cronie default
        /sbin/rc-update add rsyslog default
        /sbin/rc-update add nfsclient default
        /sbin/rc-update add autofs default
        /sbin/rc-update add haveged default
        /sbin/rc-update add snmpd default
        /sbin/rc-update add lvmetad default
        /sbin/rc-update add atd default

        echo "Europe/Berlin" > /etc/timezone
        emerge --config sys-libs/timezone-data

        echo "Welcome to Gentoo \n \O (\s \m \r) \t - Ede Vau & Partner ${PVR}" > /etc/issue

        # ROOT-SSH Zugang
        mkdir -p /root/.ssh
        chmod 600 /root/.ssh
        cat "${FILESDIR}/authorized_keys" /root/.ssh/authorized_keys | \
        sort -u > /root/.ssh/authorized_keys.new &&
        mv /root/.ssh/authorized_keys.new /root/.ssh/authorized_keys

        # Nagios
        /usr/sbin/usermod -d /var/nagios/home/ nagios
        mkdir -p /var/nagios/home/.ssh/
        cat "${FILESDIR}/nagios_authorized_keys" /var/nagios/home/.ssh/authorized_keys | \
        sort -u > /var/nagios/home/.ssh/authorized_keys.new &&
        mv /var/nagios/home/.ssh/authorized_keys.new /var/nagios/home/.ssh/authorized_keys
        chmod 700 /var/nagios/home/.ssh/
        chown -R nagios:nagios /var/nagios/home/
        if [ ! -h /usr/local/nagios/libexec ]; then
                mkdir -p /usr/local/nagios/
                ln -s /usr/lib64/nagios/plugins/ /usr/local/nagios/libexec
        fi

	echo "postmaster: b-postmaster@edevau.net" >> /etc/aliases
	echo "root:       b@edevau.net" >> /etc/aliases
	cat /etc/aliases | sort -u > /tmp/aliases.tmp && mv /tmp/aliases.tmp /etc/aliases
        /usr/bin/newaliases
        /usr/bin/gcc-config x86_64-pc-linux-gnu-7.3.0

        [ ! -f /etc/logrotate.conf ] && (
                ewarn "/etc/logrotate.conf not found, please reinstall logrotate"
                ewarn "emerge -t1av logrotate"
                sleep 10
                )

        return
}

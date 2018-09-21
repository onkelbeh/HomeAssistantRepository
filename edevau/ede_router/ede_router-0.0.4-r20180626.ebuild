# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/ssh/ssh-0.ebuild,v 1.5 2014/03/31 20:31:02 ulm Exp $

EAPI=6
inherit eutils

DESCRIPTION="OpenVPN/Quagga/Squid"
SLOT="0"
KEYWORDS="amd64"
MERGE_TYPE="source"

DEPEND="app-crypt/easy-rsa
	edevau/ede_core
	net-misc/quagga
	net-vpn/openvpn"

pkg_postinst()
{
        /sbin/rc-update add zebra default
        /sbin/rc-update add ospfd default
	mkdir /var/log/openvpn
	chown openvpn.openvpn /var/log/openvpn
	return
}

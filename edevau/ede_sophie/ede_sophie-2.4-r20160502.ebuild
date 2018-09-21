# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/ssh/ssh-0.ebuild,v 1.5 2014/03/31 20:31:02 ulm Exp $

EAPI=5
inherit eutils user

DESCRIPTION="Pakete+Config fuer Sophos Virenscanner"
SLOT="0"
KEYWORDS="amd64"

SRC_URI="
	https://gentoorepo.in.edevau.net/edevau/2017/sophie/${P}.tar.xz
	"

src_unpack() {
	mkdir -p "${S}"
	return 0
}

pkg_setup() {
	enewgroup sophosav
	enewuser sophosav -1 -1 /opt/sophos-av sophosav
}

src_install () {
	mkdir -p "${D}"
	cd "${D}"
	tar -xavvf "${DISTDIR}/${A}"
	rm "${D}/usr/local/bin/.keep"
	mkdir -p "${D}/var/log/savdi/"


	rc-update add sav-protect
	rc-update add savdid
}

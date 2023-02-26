# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit nodejs-mod systemd tmpfiles

DESCRIPTION="A visual tool for wiring the Internet of Things."
HOMEPAGE="https://nodered.org"
SRC_URI="https://github.com/${PN}/${PN}/archive/refs/tags/${PV}.tar.gz  -> ${P}.tar.gz
		https://raw.githubusercontent.com/inode64/inode64-overlay/main/dist/${P}-node_modules.tar.xz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	acct-group/node-red
	acct-user/node-red
"

NODEJS_EXTRA_FILES="packages"

src_prepare() {
	default

	# TODO: remove bcrypt fail to compile
	rm -rf node_modules/bcrypt || die
}

src_install() {
	# Remove jsdoc-nr-template, prune use git to get the version
	rm -rf node_modules/jsdoc-nr-template/ || die
	sed -i -e '/jsdoc-nr-template/d' package.json || die

	nodejs-mod_src_install

	dotmpfiles "${FILESDIR}"/node-red.conf

	doinitd "${FILESDIR}"/${PN}
	systemd_dounit "${FILESDIR}/${PN}.service"
}

pkg_postinst() {
	tmpfiles_process node-red.conf
}

# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit meson git-r3
DESCRIPTION="UDP transport with optional reliability"
HOMEPAGE="https://dev.freebox.fr/sdk/librdp/"
EGIT_REPO_URI="https://github.com/fbx/librudp.git"

LICENSE=""
SLOT="0"
KEYWORDS=""

DEPEND="=dev-libs/libela-${PV}"
RDEPEND="${DEPEND}"
BDEPEND=""
IUSE="tests"

src_configure() {
	local emesonargs
	mapfile -t emesonargs < <(meson_use tests)
	meson_src_configure
}

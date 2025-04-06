# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit meson git-r3
DESCRIPTION="Runtime Event Loop Abstraction library"
HOMEPAGE="https://dev.freebox.fr/sdk/libela/"
EGIT_REPO_URI="https://github.com/fbx/libela.git"

LICENSE=""
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
IUSE="tests"
src_prepare() {
	eapply "${FILESDIR}/meson_link_with.patch"
	eapply_user
}

src_configure() {
	local emesonargs
	mapfile -t emesonargs < <(meson_use tests)
	meson_src_configure
}

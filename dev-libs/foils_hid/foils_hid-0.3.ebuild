# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit meson git-r3
DESCRIPTION="Freebox Network HID devices library"
HOMEPAGE="https://dev.freebox.fr/sdk/foils_hid/"
EGIT_REPO_URI="https://github.com/fbx/foils_hid.git"

LICENSE=""
SLOT="0"
KEYWORDS=""

DEPEND="=dev-libs/librudp-${PV}"
RDEPEND="${DEPEND}"
BDEPEND=""
IUSE="tests"

src_configure() {
	local emesonargs=(
		$(meson_use tests)		
    )
	meson_src_configure
}

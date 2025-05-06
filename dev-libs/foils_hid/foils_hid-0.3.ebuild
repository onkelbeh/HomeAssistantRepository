# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit meson git-r3
DESCRIPTION="Freebox Network HID devices library"
HOMEPAGE="https://dev.freebox.fr/sdk/foils_hid/ https://github.com/fbx/foils_hid.git"
EGIT_REPO_URI="https://github.com/fbx/foils_hid.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="~dev-libs/librudp-${PV}"
RDEPEND="${DEPEND}"
IUSE="tests"

src_configure() {
	local emesonargs
	mapfile -t emesonargs < <(meson_use tests)
	meson_src_configure
}

# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit meson git-r3
DESCRIPTION="UDP transport with optional reliability"
HOMEPAGE="https://dev.freebox.fr/sdk/librdp/ https://github.com/fbx/librudp.git"
EGIT_REPO_URI="https://github.com/fbx/librudp.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

DEPEND="~dev-libs/libela-${PV}"
RDEPEND="${DEPEND}"
IUSE="tests"

src_configure() {
	local emesonargs
	mapfile -t emesonargs < <(meson_use tests)
	meson_src_configure
}

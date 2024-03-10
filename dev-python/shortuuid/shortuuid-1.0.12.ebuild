# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A generator library for concise, unambiguous and URL-safe UUIDs."
HOMEPAGE="https://github.com/skorokithakis/shortuuid/ https://pypi.org/project/shortuuid/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

src_prepare() {
	remove unneccesary include
	sed "20d" -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest

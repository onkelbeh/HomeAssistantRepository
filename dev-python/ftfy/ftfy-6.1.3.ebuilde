# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Fixes mojibake and other problems with Unicode, after the fact"
HOMEPAGE=" https://pypi.org/project/ftfy/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/wcwidth[${PYTHON_USEDEP}]"
src_prepare() {
	remove uneccesary include
	sed "7d" -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Monarch Money API for Python"
HOMEPAGE="https://github.com/hammem/monarchmoney https://pypi.org/project/monarchmoney/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/gql[${PYTHON_USEDEP}]
	dev-python/oathtool[${PYTHON_USEDEP}]"

src_prepare() {
	echo "aiohttp>=3.8.4" >> requirements.txt || die
	eapply_user
}

distutils_enable_tests pytest

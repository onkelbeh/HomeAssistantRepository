# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Unofficial python package to access Bring! shopping lists API."
HOMEPAGE="https://github.com/blue1stone/python-bring-api https://pypi.org/project/python-bring-api/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"
DOCS="README.md"
RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Electric Kiwi Python API"
HOMEPAGE=" https://pypi.org/project/electrickiwi-api/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
DOCS="README.md"
RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"

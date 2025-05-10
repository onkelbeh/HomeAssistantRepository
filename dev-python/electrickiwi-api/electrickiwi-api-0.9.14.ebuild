# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Electric Kiwi Python API"
HOMEPAGE=" https://pypi.org/project/electrickiwi-api/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
DOCS="README.md"
RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"

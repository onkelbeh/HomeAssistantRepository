# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="A package to interact with Tedee locks using asyncio"
HOMEPAGE="
	https://pypi.org/project/aiotedee/
	https://github.com/zweckj/aiotedee
"

LICENSE="MIT"
SLOT="0"
PATCHES="
	${FILESDIR}/${PN}-build-system.patch
"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

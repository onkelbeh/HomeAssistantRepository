# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="A Python implementation of the new La Marzocco API"
HOMEPAGE="
	https://pypi.org/project/pylamarzocco/
	https://github.com/zweckj/pylamarzocco
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/bleak-0.20.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.8[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}
"

distutils_enable_tests pytest

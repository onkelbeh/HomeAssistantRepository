# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="Retrieve values from API at Nord Pool."
HOMEPAGE="
	https://pypi.org/project/pynordpool/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiohttp-3.9.2[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

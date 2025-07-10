# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="An asyncio client for the Home Connect API."
HOMEPAGE="https://pypi.org/project/aiohomeconnect/ https://github.com/MartinHjelmare/aiohomeconnect"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/httpx-0.28.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-sse-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

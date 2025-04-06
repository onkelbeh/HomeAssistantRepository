# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )
PYPI_PN="aiohttp-sse"
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Server-sent events support for aiohttp."
HOMEPAGE="
	https://pypi.org/project/aiohttp_sse/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/aiohttp-3.11.13[${PYTHON_USEDEP}]
	>=dev-python/pytest-8.3.5[${PYTHON_USEDEP}]
	>=dev-python/pytest-aiohttp-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-asyncio-0.26.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-6.0.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

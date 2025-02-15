# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client library for the Habitica API"
HOMEPAGE="
	https://pypi.org/project/habiticalib/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiohttp-3.11.11[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.15[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.10.12[${PYTHON_USEDEP}]
	>=dev-python/pillow-11.1.0[${PYTHON_USEDEP}]
	>=dev-python/habitipy-0.3.3[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client for Overseerr."
HOMEPAGE="https://pypi.org/project/python-overseerr/ https://github.com/joostlek/python-overseerr"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.11[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="A python package for using igloohome's API"
HOMEPAGE="
	https://pypi.org/project/igloohome-api/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/pyjwt-2.10.1[${PYTHON_USEDEP}]
	>=dev-python/dacite-1.8.1[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.11.10[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

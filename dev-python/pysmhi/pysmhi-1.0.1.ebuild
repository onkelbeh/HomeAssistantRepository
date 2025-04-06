# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="Retrieve open data from SMHI api"
HOMEPAGE="https://github.com/gjohansson-ST/pysmhi https://pypi.org/project/pysmhi/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND=">=dev-python/aiohttp-3.9.2[${PYTHON_USEDEP}]"
BDEPEND=""

distutils_enable_tests pytest

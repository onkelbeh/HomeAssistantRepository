# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="An API for the homematicip cloud"
HOMEPAGE="https://github.com/hahn-th/homematicip-rest-api https://pypi.org/project/homematicip/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/requests-2.32.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.10.2[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

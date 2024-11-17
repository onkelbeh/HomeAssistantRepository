# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="A python3 library to communicate with Tibber"
HOMEPAGE="https://github.com/Danielhiversen/pyTibber https://pypi.org/project/pyTibber/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.0.6[${PYTHON_USEDEP}]
	>=dev-python/gql-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-10.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

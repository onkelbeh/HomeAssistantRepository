# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A clean, well-tested Python3 API for Flu Near You"
HOMEPAGE="https://github.com/bachya/pyflunearyou https://pypi.org/project/pyflunearyou/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/aiocache-0.11.1[${PYTHON_USEDEP}]
	>=dev-python/msgpack-0.6.2[${PYTHON_USEDEP}]
	dev-python/ujson[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

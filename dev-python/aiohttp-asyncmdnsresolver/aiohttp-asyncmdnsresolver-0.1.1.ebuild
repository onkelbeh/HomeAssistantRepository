# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3_11 python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="An async resolver for aiohttp that supports MDNS"
HOMEPAGE="https://pypi.org/project/aiohttp-asyncmdnsresolver/ https://github.com/aio-libs/aiohttp-asyncmdnsresolver/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/aiodns-3.2.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.10.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.142.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

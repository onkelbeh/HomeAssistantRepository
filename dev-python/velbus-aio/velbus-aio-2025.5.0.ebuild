# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python Library for the Velbus protocol based on asyncio"
HOMEPAGE="https://github.com/Cereal2nd/velbus-aio https://pypi.org/project/velbus-aio/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/pyserial-asyncio-fast-0.11[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	dev-python/aiofile[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.10.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

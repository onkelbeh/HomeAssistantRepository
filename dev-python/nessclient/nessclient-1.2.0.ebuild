# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Implementation of the Ness D8x / D16x Serial Interface ASCII protocol"
HOMEPAGE="https://github.com/nickw444/nessclient https://pypi.org/project/nessclient/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	dev-python/justbackoff[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio-fast[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/asynctest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python Serial Port Extension - Asynchronous I/O support"
HOMEPAGE="https://github.com/home-assistant-libs/pyserial-asyncio-fast https://pypi.org/project/pyserial-asyncio-fast/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/pyserial-3.1.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

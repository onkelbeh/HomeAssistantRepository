# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Server Side Events (SSE) client for Python 3"
HOMEPAGE="https://github.com/ebraminio/aiosseclient https://pypi.org/project/aiosseclient/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]"
BDEPEND=""

distutils_enable_tests pytest

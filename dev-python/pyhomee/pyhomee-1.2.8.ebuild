# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="a python library to interact with homee"
HOMEPAGE="https://pypi.org/project/pyHomee/ https://github.com/Taraman17/pyHomee"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/aiohttp-3.11[${PYTHON_USEDEP}]
	>=dev-python/websockets-13[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

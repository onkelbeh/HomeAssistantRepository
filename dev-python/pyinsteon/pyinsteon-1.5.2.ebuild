# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python API for controlling Insteon devices"
HOMEPAGE="https://github.com/pyinsteon/pyinsteon https://pypi.org/project/pyinsteon/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

DOCS="DESCRIPTION.rst"

RDEPEND="
	dev-python/PyPubSub[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/pyserial-asyncio-0.5[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]
"

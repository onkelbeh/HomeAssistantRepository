# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Epson projector support for Python"
HOMEPAGE="https://github.com/pszafer/epson_projector https://pypi.org/project/epson-projector/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.3.0[${PYTHON_USEDEP}]
	>=dev-python/pyserial-asyncio-0.4[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-3.0.0[${PYTHON_USEDEP}]"

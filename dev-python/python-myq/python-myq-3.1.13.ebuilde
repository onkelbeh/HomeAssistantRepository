# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python package for controlling MyQ-Enabled Garage Door."
HOMEPAGE="https://github.com/Python-MyQ/Python-MyQ https://pypi.org/project/python-myq/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
DOCS="README.md"

RDEPEND="!dev-python/pymyq
	>=dev-python/aiohttp-3.7[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.9.3[${PYTHON_USEDEP}]
	>=dev-python/pkce-1.0.2[${PYTHON_USEDEP}]"

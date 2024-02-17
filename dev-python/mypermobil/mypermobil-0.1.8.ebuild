# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python wrapper for the MyPermobil API"
HOMEPAGE="https://github.com/IsakNyberg/MyPermobil-API https://pypi.org/project/mypermobil/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/aiocache[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/aiounittest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

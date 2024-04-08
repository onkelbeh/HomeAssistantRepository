# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Async for Oncue"
HOMEPAGE="https://github.com/bdraco/aiooncue https://pypi.org/project/aiooncue/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/pytest-runner[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

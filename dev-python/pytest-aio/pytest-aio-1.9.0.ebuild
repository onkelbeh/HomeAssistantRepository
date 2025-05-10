# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Pytest plugin for testing async python code"
HOMEPAGE="https://github.com/klen/pytest-aio https://pypi.org/project/pytest-aio/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/curio-compat[${PYTHON_USEDEP}]
	dev-python/trio[${PYTHON_USEDEP}]
	dev-python/uvloop[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest

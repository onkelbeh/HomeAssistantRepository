# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Atomic file writes"
HOMEPAGE="https://github.com/untitaker/python-atomicwrites/ https://pypi.org/project/atomicwrites/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

#DEPEND="!dev-python/atomicwrites[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
distutils_enable_sphinx docs dev-python/sphinx_rtd_theme

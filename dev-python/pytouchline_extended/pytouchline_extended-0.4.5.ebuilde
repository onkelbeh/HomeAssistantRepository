# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="A Roth Touchline interface library"
HOMEPAGE="https://github.com/brondum/pytouchline https://pypi.org/project/pytouchline_extended/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/httplib2[${PYTHON_USEDEP}]
	|| ( dev-python/cchardet[${PYTHON_USEDEP}] dev-python/faust-cchardet[${PYTHON_USEDEP}] )
"
BDEPEND=""

distutils_enable_tests pytest

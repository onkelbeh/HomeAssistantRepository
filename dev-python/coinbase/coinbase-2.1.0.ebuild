# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Coinbase API client library"
HOMEPAGE="https://github.com/coinbase/coinbase-python/ https://pypi.org/project/coinbase/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="PYPIREADME.rst"

RDEPEND=">=dev-python/requests-2.5[${PYTHON_USEDEP}]
	>=dev-python/six-1.9[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.4.11[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

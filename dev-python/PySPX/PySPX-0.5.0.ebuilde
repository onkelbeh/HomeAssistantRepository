# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Python bindings for SPHINCS+"
HOMEPAGE="https://github.com/sphincs/pyspx https://pypi.org/project/PySPX/"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/cffi-1.0.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Python implementation of the Engine.IO realtime server."
HOMEPAGE="https://python-engineio.readthedocs.org/ https://github.com/miguelgrinberg/python-engineio/ https://pypi.org/project/python-engineio/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

DOCS="README.rst"

RDEPEND=">=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.4[${PYTHON_USEDEP}]
	>=dev-python/requests-2.21.0[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

# pypi tarball does not contain tests
RESTRICT="test"

python_test() {
	esetup.py test || die "Tests failed under ${EPYTHON}"
}

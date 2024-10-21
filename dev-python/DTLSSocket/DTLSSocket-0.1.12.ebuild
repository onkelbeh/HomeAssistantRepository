# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="DTLSSocket"
inherit distutils-r1 pypi

DESCRIPTION="DTLSSocket is a cython wrapper for tinydtls with a Socket like interface"
HOMEPAGE="https://git.fslab.de/jkonra2m/tinydtls-cython https://pypi.org/project/DTLSSocket/"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

BDEPEND="<dev-python/cython-3[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

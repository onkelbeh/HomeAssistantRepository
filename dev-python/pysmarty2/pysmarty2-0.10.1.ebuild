# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python API for Salda Smarty Modbus TCP"
HOMEPAGE="https://github.com/martinssipenko/pysmarty2 https://pypi.org/project/pysmarty2/"
SRC_URI="https://github.com/martinssipenko/${PN}/archive/refs/tags/v${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/pymodbus-3.6.9[${PYTHON_USEDEP}] <dev-python/pymodbus-4.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

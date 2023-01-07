# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1

DESCRIPTION="Pure-Python, open source and free implementation of v1/v2c/v3 SNMP engine"
HOMEPAGE="https://github.com/pysnmp/pysnmp https://pypi.org/project/pysnmplib/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/pysnmp-pysmi-1.0.4[${PYTHON_USEDEP}]
	>=dev-python/pysnmp-pyasn1-1.0.3[${PYTHON_USEDEP}]
	>=dev-python/pycryptodomex-3.11.0[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

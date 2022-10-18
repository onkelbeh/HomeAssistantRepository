# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Python OWFS client library (owserver protocol)"
HOMEPAGE="https://github.com/miccoli/pyownet https://pypi.org/project/pyownet/"
SRC_URI="https://github.com/miccoli/${PN}/archive/refs/tags/v${PV}.post1.tar.gz -> ${P}.tar.gz"
MY_PV=${PV/_p/.post}
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${PN}-${MY_PV}.tar.gz"
S="${WORKDIR}/${PN}-${MY_PV}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
	tests/test_protocol || die
}

PATCHES=( "${FILESDIR}/pyownet-${PV}-2to3.patch" )

distutils_enable_tests pytest

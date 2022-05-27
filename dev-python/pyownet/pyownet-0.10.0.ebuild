# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Python OWFS client library (owserver protocol)"
HOMEPAGE="https://github.com/miccoli/pyownet https://pypi.org/project/pyownet/"
SRC_URI="https://github.com/miccoli/${PN}/archive/refs/tags/v${PV}.post1.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${PN}-${PV}.post1/

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=""
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

PATCHES=( "${FILESDIR}/pyownet-${PV}-2to3.patch" )

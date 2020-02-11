# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="A Declarative HTTP Client for Python."
HOMEPAGE="https://uplink.readthedocs.io/ https://pypi.org/project/uplink/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=""
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.12.0[${PYTHON_USEDEP}]
	>=dev-python/uritemplate-3.0.0[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

PATCHES=( "${FILESDIR}"/${P}-notest.patch )

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

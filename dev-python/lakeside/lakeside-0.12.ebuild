# Copyright 1999-2019 Gentoo Authors Andreas Billmeier b@edevau.net
# Distributed under the terms of the GNU General Public License v3.0

EAPI=6

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Python API for controlling Eufy LED bulbs"
HOMEPAGE="https://github.com/google/python-lakeside https://pypi.org/project/lakeside/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="dev-python/protobuf-python[${PYTHON_USEDEP}]
		 dev-python/pycryptodome[${PYTHON_USEDEP}]
		 dev-python/requests[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

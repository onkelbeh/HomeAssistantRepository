# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3.0

EAPI=6

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Python client for Owlet monitors"
HOMEPAGE="https://github.com/craigjmidwinter/pyowlet https://pypi.org/project/pyowlet/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=""
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

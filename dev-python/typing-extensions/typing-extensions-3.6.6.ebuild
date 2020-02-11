# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

MY_P=${PN/-/_}-${PV}
DESCRIPTION="Backported and Experimental Type Hints for Python 3.5+"
HOMEPAGE="https://github.com/python/typing/blob/master/typing_extensions/README.rst https://pypi.org/project/typing-extensions/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_P}.tar.gz"
#SRC_URI="https://files.pythonhosted.org/packages/fc/e6/3d2f306b12f01bde2861d67458d32c673e206d6fcc255537bf452db8f80c/typing_extensions-3.6.6.tar.gz -> ${P}.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"
S=${WORKDIR}/${MY_P}

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

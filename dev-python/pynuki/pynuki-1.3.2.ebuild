# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Python bindings for nuki.io bridges"
HOMEPAGE="https://github.com/pschmitt/pynuki https://pypi.org/project/pynuki/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="~dev-python/appdirs-1.4.3[${PYTHON_USEDEP}]
		 ~dev-python/packaging-19.0[${PYTHON_USEDEP}]
		 ~dev-python/pyparsing-2.4.0[${PYTHON_USEDEP}]
		 ~dev-python/requests-2.22.0[${PYTHON_USEDEP}]
		 ~dev-python/six-1.11.0[${PYTHON_USEDEP}]"
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

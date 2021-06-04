# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{8..9} )

inherit distutils-r1

DESCRIPTION="Python bindings for nuki.io bridges"
HOMEPAGE="https://github.com/pschmitt/pynuki https://pypi.org/project/pynuki/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

# seems that requirements.txt is not read at all
RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"

# RDEPEND="~dev-python/appdirs-1.4.4[${PYTHON_USEDEP}]
#		 ~dev-python/packaging-20.4[${PYTHON_USEDEP}]
#		 ~dev-python/pyparsing-2.4.7[${PYTHON_USEDEP}]
#		 dev-python/requests[${PYTHON_USEDEP}]
#		 >=dev-python/six-1.14.0[${PYTHON_USEDEP}]"

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

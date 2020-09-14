# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Package for creating data pipelines with chain functional programming"
HOMEPAGE="https://github.com/EntilZha/PyFunctional https://pypi.org/project/pyfunctional/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
MY_PN="PyFunctional"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${MY_PN}-${PV}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/dill-0.2.5[${PYTHON_USEDEP}]
	<dev-python/tabulate-1.0.0[${PYTHON_USEDEP}]"
BDEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

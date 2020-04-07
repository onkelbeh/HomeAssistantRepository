# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="pywbem - A WBEM client"
HOMEPAGE="https://pywbem.github.io/pywbem/ https://pypi.org/project/pywbem/"
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/ply-3.10[${PYTHON_USEDEP}]
		 >=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
		 >=dev-python/six-1.10.0[${PYTHON_USEDEP}]
		 >=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
		 ~dev-python/custom-inherit-2.2.2[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

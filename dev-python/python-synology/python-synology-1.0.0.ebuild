# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

DESCRIPTION="Python API for communication with Synology DSM"
HOMEPAGE="https://github.com/ProtoThis/python-synology https://pypi.org/project/python-synology/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
#Pypi SDIST Source still is incomplete
SRC_URI="https://github.com/ProtoThis/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS="README.rst"

RDEPEND=">=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.24.3[${PYTHON_USEDEP}]"
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

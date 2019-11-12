# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1
MY_P=${PN/-/_}-${PV}

DESCRIPTION="Read metadata from Python packages"
HOMEPAGE="http://importlib-metadata.readthedocs.io/ https://pypi.org/project/importlib-metadata/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=""
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/zipp-0.5[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"
S=${WORKDIR}/${MY_P}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

MY_PN=${PN//-/_}
MY_P=${P//-/_}
DESCRIPTION="Minimalistic Python client for the NextBus public API for real-time transit arrival data"
HOMEPAGE="https://github.com/pmaris/py_nextbus https://pypi.org/project/py-nextbus/"
#SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"
SRC_URI="https://files.pythonhosted.org/packages/f5/04/6a23b5c057ae74ec3da48fbc008d6bae489f64db39c19c6ede94da9aea57/py_nextbus-${PVR}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=""
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S=${WORKDIR}/${MY_PN}-${PV}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

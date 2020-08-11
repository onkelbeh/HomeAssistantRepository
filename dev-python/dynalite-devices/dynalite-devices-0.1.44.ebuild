# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1
MY_P=${PN/-/_}-${PV}

DESCRIPTION="An unofficial Dynalite DyNET interface creating devices."
HOMEPAGE="https://github.com/ziv1234/python-dynalite-devices https://pypi.org/project/dynalite-devices/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_P}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="~dev-python/dynalite-0.1.32[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S=${WORKDIR}/${MY_P}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

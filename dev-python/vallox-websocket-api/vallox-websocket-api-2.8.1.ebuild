# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

MY_PN=${PN//-/_}
MY_P=${MY_PN}-${PV}
DESCRIPTION="Vallox WebSocket API"
HOMEPAGE="https://github.com/yozik04/vallox_websocket_api https://pypi.org/project/vallox-websocket-api/"
SRC_URI="mirror://pypi/${P:0:1}/${MY_PN}/${MY_P}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/websockets-9.1[${PYTHON_USEDEP}]
		 <dev-python/websockets-10.0[${PYTHON_USEDEP}]
		 >=dev-python/construct-2.9.0[${PYTHON_USEDEP}]
		 <dev-python/construct-3.0.0[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/asynctest[${PYTHON_USEDEP}]
	)"

S=${WORKDIR}/${MY_PN}-${PV}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

MY_PN=${PN//-/_}
MY_P=${MY_PN}-${PV}
DESCRIPTION="Vallox WebSocket API"
HOMEPAGE="https://github.com/yozik04/vallox_websocket_api https://pypi.org/project/vallox-websocket-api/"
SRC_URI="mirror://pypi/${P:0:1}/${MY_PN}/${MY_P}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/websockets-7.0[${PYTHON_USEDEP}]
		 <dev-python/websockets-8.0[${PYTHON_USEDEP}]
		 >=dev-python/construct-2.9.0[${PYTHON_USEDEP}]
		 <dev-python/construct-3.0.0[${PYTHON_USEDEP}]"
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

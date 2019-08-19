# Copyright 1999-2019 Gentoo Authors Andreas Billmeier b (at) edevau.net
# Distributed under the terms of the GNU General Public License v3.0

EAPI="7"

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="An API for the homematicip cloud"
HOMEPAGE="https://github.com/coreGreenberet/homematicip-rest-api https://pypi.org/project/homematicip/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/requests-2.4.3[${PYTHON_USEDEP}]
		 >=dev-python/websocket-client-0.54.0[${PYTHON_USEDEP}]
		 dev-python/async_timeout[${PYTHON_USEDEP}]
		 dev-python/websockets[${PYTHON_USEDEP}]
		 >=dev-python/aiohttp-3.0.6[${PYTHON_USEDEP}]
		 dev-python/aenum[${PYTHON_USEDEP}]"
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

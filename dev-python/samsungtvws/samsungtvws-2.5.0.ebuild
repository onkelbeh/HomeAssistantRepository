# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Samsung Smart TV WS API wrapper"
HOMEPAGE="https://github.com/xchwarze/samsung-tv-ws-api https://pypi.org/project/samsungtvws/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 x86 amd64-linux ~x86-linux"
IUSE="+async +encrypted test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/websocket-client-0.57.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
	async? ( >=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
		   >=dev-python/websockets-10.2[${PYTHON_USEDEP}] )
	encrypted? ( >=dev-python/cryptography-35.0.0[${PYTHON_USEDEP}]
		   >=dev-python/py3rijndael-0.3.3[${PYTHON_USEDEP}] )"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="An async python interface for Kodi over JSON-RPC."
HOMEPAGE="https://github.com/OnFreund/PyKodi https://pypi.org/project/pykodi/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="dev-python/jsonrpc-base[${PYTHON_USEDEP}]
	>=dev-python/jsonrpc-async-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/jsonrpc-websocket-1.2.1[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]"
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

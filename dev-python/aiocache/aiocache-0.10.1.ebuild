# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="multi backend asyncio cache"
HOMEPAGE="https://github.com/argaen/aiocache https://pypi.org/project/aiocache/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="dev-python/ujson[${PYTHON_USEDEP}]
		 >=dev-python/aioredis-0.3.3[${PYTHON_USEDEP}]
		 >=dev-python/aiomcache-0.5.2[${PYTHON_USEDEP}]
		 >=dev-python/msgpack-0.5.5[${PYTHON_USEDEP}]"
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

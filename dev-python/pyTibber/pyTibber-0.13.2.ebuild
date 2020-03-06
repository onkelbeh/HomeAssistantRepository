# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="A python3 library to communicate with Tibber"
HOMEPAGE="https://github.com/Danielhiversen/pyTibber https://pypi.org/project/pyTibber/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/graphql-subscription-manager-0.3.1[${PYTHON_USEDEP}]
		 >=dev-python/aiohttp-3.0.6[${PYTHON_USEDEP}]
		 >=dev-python/async_timeout-1.4.0[${PYTHON_USEDEP}]
		 >=dev-python/websockets-6.0[${PYTHON_USEDEP}]
		 dev-python/pytz[${PYTHON_USEDEP}]
		 dev-python/python-dateutil[${PYTHON_USEDEP}]"
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

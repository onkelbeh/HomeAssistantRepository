# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Python library for interfacing with Xiaomi smart appliances"
HOMEPAGE="https://github.com/rytilahti/python-miio https://pypi.org/project/python-miio/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/click-7.1.1[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.9[${PYTHON_USEDEP}]
	>=dev-python/construct-2.10.56[${PYTHON_USEDEP}]
	dev-python/zeroconf[${PYTHON_USEDEP}]
	>=dev-python/attrs-19.3.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2019.3[${PYTHON_USEDEP}]
	>=dev-python/appdirs-1.4.3[${PYTHON_USEDEP}]
	>=dev-python/tqdm4.45.0[${PYTHON_USEDEP}]
	>=dev-python/netifaces-0.10.9[${PYTHON_USEDEP}]
	>=dev-python/importlib_metadata-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/croniter-0.3.32[${PYTHON_USEDEP}]"
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

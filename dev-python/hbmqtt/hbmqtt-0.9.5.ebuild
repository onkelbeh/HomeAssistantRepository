# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="MQTT client/broker using Python 3.4 asyncio library"
HOMEPAGE="https://github.com/beerfactory/hbmqtt https://pypi.org/project/hbmqtt/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm arm64 x86 amd64-linux x86-linux"
IUSE="test"

RDEPEND=""
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/transitions[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

PATCHES=( "${FILESDIR}"/${P}-remove-tests.patch )

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

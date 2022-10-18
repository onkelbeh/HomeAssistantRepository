# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="MQTT client/broker using Python 3.4 asyncio library"
HOMEPAGE="https://github.com/beerfactory/hbmqtt https://pypi.org/project/hbmqtt/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/transitions[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]
	dev-python/passlib[${PYTHON_USEDEP}]
	dev-python/docopt[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

PATCHES=( "${FILESDIR}/${P}-remove-tests.patch" )

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

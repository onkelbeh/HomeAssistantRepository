# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1

DESCRIPTION="MQTT client/broker using Python asyncio"
HOMEPAGE="https://github.com/Yakifo/amqtt https://pypi.org/project/amqtt/"
SRC_URI="https://github.com/Yakifo/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="readme.rst"

RDEPEND=">=dev-python/transitions-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-9.0[${PYTHON_USEDEP}]
	<dev-python/websockets-11.0[${PYTHON_USEDEP}]
	>=dev-python/passlib-1.7.0[${PYTHON_USEDEP}]
	>=dev-python/docopt-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.4.0[${PYTHON_USEDEP}]
	<dev-python/pyyaml-7.0[${PYTHON_USEDEP}]
	>=dev-python/coveralls-3.0.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python program and library to control Wi-Fi enabled iRobot Roombas"
HOMEPAGE="https://github.com/pschmitt/roombapy https://pypi.org/project/roombapy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test +mqtt"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="mqtt? ( >=dev-python/paho-mqtt-1.5.1[${PYTHON_USEDEP}] )
	>=dev-python/orjson-3.8.7[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

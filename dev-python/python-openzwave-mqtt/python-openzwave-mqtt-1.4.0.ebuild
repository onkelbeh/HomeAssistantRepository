# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Converts MQTT messages from qt-openzwave into Python objects and events"
HOMEPAGE="https://github.com/cgarwood/python-openzwave-mqtt https://pypi.org/project/python-openzwave-mqtt/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test +async"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="async? ( dev-python/asyncio-mqtt[${PYTHON_USEDEP}] )"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

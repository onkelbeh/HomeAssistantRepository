# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1

DESCRIPTION="Manage Xiaomi BLE devices"
HOMEPAGE="https://github.com/bluetooth-devices/xiaomi-ble https://pypi.org/project/xiaomi-ble/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/home-assistant-bluetooth-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.1.2[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodomex-3.15.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-1.4.0[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

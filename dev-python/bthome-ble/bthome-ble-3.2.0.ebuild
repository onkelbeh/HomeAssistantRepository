# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="BThome BLE support"
HOMEPAGE="https://github.com/bluetooth-devices/bthome-ble https://pypi.org/project/bthome-ble/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/bluetooth-sensor-state-data-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/cryptography-40.0.0[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.16.1[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-0.1.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Thermopro BLE Sensors"
HOMEPAGE="https://github.com/bluetooth-devices/thermopro-ble https://pypi.org/project/thermopro-ble/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/bluetooth-data-tools-0.1.2[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.3.1[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.22.3[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-3.7.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

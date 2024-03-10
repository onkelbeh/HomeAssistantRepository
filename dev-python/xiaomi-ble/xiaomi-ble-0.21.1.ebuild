# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="Manage Xiaomi BLE devices"
HOMEPAGE="https://github.com/bluetooth-devices/xiaomi-ble https://pypi.org/project/xiaomi-ble/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

DOCS="README.md"

RDEPEND=">=dev-python/home-assistant-bluetooth-1.9.2[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.17.1[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodomex-3.18.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-40.0.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-2.13.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-0.3.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.19.5[${PYTHON_USEDEP}]"

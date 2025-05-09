# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Tools to enumerate and find Bluetooth Adapters"
HOMEPAGE="https://github.com/bluetooth-devices/bluetooth-adapters https://pypi.org/project/bluetooth-adapters/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/dbus-fast-1.21.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.22.3[${PYTHON_USEDEP}]
	>=dev-python/usb-devices-0.4.5[${PYTHON_USEDEP}]
	>=dev-python/aiooui-0.1.9[${PYTHON_USEDEP}]
	>=dev-python/uart-devices-0.1.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

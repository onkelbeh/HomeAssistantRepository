# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3_11 python3_{11..14} )
DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="High availability Bluetooth"
HOMEPAGE="https://github.com/bluetooth-devices/habluetooth https://pypi.org/project/habluetooth/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/bleak-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-4.2.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-1.28.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-adapters-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-auto-recovery-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/async-interrupt-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/dbus-fast-2.30.2[${PYTHON_USEDEP}]
	>=dev-python/btsocket-0.3.0[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/freezegun[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

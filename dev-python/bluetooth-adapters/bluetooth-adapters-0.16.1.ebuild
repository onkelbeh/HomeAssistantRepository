# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
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
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10)
	>=dev-python/dbus-fast-1.21.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.15.1[${PYTHON_USEDEP}]
	>=dev-python/usb-devices-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
	>=dev-python/mac-vendor-lookup-0.1.12[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

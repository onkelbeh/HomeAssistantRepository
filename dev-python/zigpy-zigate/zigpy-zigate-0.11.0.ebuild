# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
DESCRIPTION="A library which communicates with ZiGate radios for zigpy"
HOMEPAGE="https://github.com/zigpy/zigpy-zigate https://pypi.org/project/zigpy-zigate/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	>=dev-python/pyserial-asyncio-0.5[${PYTHON_USEDEP}]
	>=dev-python/pyusb-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/zigpy-0.51.0[${PYTHON_USEDEP}]
	dev-python/gpiozero[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

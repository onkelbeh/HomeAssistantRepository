# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Tool to flash firmware onto any Silicon Labs radio running EmberZNet, CPC multi-PAN, or just a bare Gecko Bootloader"
HOMEPAGE="https://github.com/NabuCasa/universal-silabs-flasher https://pypi.org/project/universal-silabs-flasher/"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/click[${PYTHON_USEDEP}]
	dev-python/zigpy[${PYTHON_USEDEP}]
	dev-python/crc[${PYTHON_USEDEP}]
	>=dev-python/bellows-0.34.3[${PYTHON_USEDEP}]
	dev-python/gpiod[${PYTHON_USEDEP}]
	dev-python/coloredlogs[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

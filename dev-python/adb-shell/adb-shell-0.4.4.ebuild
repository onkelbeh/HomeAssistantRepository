# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="A Python implementation of ADB with shell and FileSync functionality."
HOMEPAGE="https://github.com/JeffLIrion/adb_shell https://pypi.org/project/adb-shell/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test usb"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/aiofiles-0.4.0[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	|| ( dev-python/pyasn1[${PYTHON_USEDEP}] dev-python/pysnmp-pyasn1[${PYTHON_USEDEP}] )
	dev-python/rsa[${PYTHON_USEDEP}]
	usb? ( >=dev-python/libusb1-1.0.16[${PYTHON_USEDEP}] )"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

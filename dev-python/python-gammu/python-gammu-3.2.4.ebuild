# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Gammu bindings"
HOMEPAGE="https://wammu.eu/python-gammu/ https://github.com/gammu/python-gammu/ https://pypi.org/project/python-gammu/"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="app-mobilephone/gammu
	dev-python/pybluez[${PYTHON_USEDEP}]
	dev-python/libusb1[${PYTHON_USEDEP}]
	dev-python/pycurl[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests unittest

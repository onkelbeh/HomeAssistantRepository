# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Communicate with an Android TV or Fire TV device via ADB over a network."
HOMEPAGE="https://github.com/JeffLIrion/python-androidtv/ https://pypi.org/project/androidtv/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test usb"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/pure-python-adb-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/adb-shell-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/adb-shell-0.4.0[usb?,${PYTHON_USEDEP}]
	>=dev-python/aiofiles-0.4.0[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

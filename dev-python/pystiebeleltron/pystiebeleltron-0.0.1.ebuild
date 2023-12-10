# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Python API for interacting with the Stiebel Eltron ISG web gateway via Modbus."
HOMEPAGE="https://github.com/fucm/python-stiebel-eltron https://pypi.org/project/pystiebeleltron/"
MY_PN="python-stiebel-eltron"
COMMIT="536367f6b272b13f33437ad33a6cc6b5c6ab55d3"
SRC_URI="https://codeload.github.com/fucm/${MY_PN}/zip/${COMMIT} -> ${P}.gh.zip"
S=${WORKDIR}/${MY_PN}-${COMMIT}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/pymodbus-2.1.0[${PYTHON_USEDEP}]"
BDEPEND="
	app-arch/unzip
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -i "s/packages=find_packages()/packages=find_packages(exclude=['test'])/g" -i setup.py || die
	eapply_user
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
#DISTUTILS_USE_PEP517=setuptools|poetry
inherit distutils-r1 pypi

DESCRIPTION="A Dremel 3D Printer Python Library running on Python 3"
HOMEPAGE="https://github.com/godely/dremel3dpy https://pypi.org/project/dremel3dpy/"
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS=""

RDEPEND=">=dev-python/decorator-5.0[${PYTHON_USEDEP}]
	>=dev-python/imageio-2.0[${PYTHON_USEDEP}]
	>=dev-python/imutils-0.5[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.0[${PYTHON_USEDEP}]
	dev-python/validators[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

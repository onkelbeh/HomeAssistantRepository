# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Python-based API to interact with the Legrand Home + Control interface"
HOMEPAGE="https://github.com/chemaaa/homepluscontrol https://pypi.org/project/homepluscontrol/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

#DOCS="README-md"

RDEPEND=">=dev-python/aiohttp-3.7.1[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-1.7.1[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.4.2[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

src_prepare() {
	sed -i "s/packages=setuptools.find_packages()/packages=setuptools.find_packages(exclude=['test','test.*'])/g" -i setup.py || die
	eapply_user
}

distutils_enable_tests pytest

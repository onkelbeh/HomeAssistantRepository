# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="a library for controlling certain robot vacuums"
HOMEPAGE="https://github.com/wpietri/sucks https://pypi.org/project/sucks/"
SRC_URI="https://github.com/wpietri/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

#DOCS="README.rst"

RDEPEND=">=dev-python/sleekxmppfs-1.3.4[${PYTHON_USEDEP}]
	>=dev-python/click-6[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.4[${PYTHON_USEDEP}]
	>=dev-python/pycountry-convert-0.5[${PYTHON_USEDEP}]
	>=dev-python/stringcase-1.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		>=dev-python/mock-1.3[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Allows using distutils2-like setup.cfg files for a package's metadata with a distribute/setuptools setup.py"
HOMEPAGE="https://github.com/embray/d2to1 https://pypi.org/project/d2to1/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${PN}-${PV/_p/.post}.tar.gz"
S="${WORKDIR}"/${P/_p/.post}

# taken from https://github.com/embray/d2to1/blob/master/setup.cfg
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

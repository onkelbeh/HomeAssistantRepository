# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="PS4 2nd Screen Python Library"
HOMEPAGE="https://github.com/ktnrg45/pyps4-2ndscreen https://pypi.org/project/pyps4-2ndscreen/"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/construct-2.9.45[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.7.2[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.5.4[${PYTHON_USEDEP}]
	>=dev-python/click-7.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

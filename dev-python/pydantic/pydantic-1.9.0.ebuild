# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Data validation and settings management using python type hints"
HOMEPAGE="https://github.com/samuelcolvin/pydantic https://pypi.org/project/pydantic/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/typing-extensions[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		  dev-python/hypothesis[${PYTHON_USEDEP}]
		  dev-python/pytest-mock[${PYTHON_USEDEP}]
		  dev-python/python-dotenv[${PYTHON_USEDEP}]
		  >=dev-python/python-email-validator-1.2.1[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -i -e '/CFLAGS/d' setup.py || die
	distutils-r1_src_prepare
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

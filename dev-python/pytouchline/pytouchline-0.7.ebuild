# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Roth Touchline interface library"
HOMEPAGE="https://github.com/abondoe/pytouchline https://pypi.org/project/pytouchline/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

#DOCS="README.md"

RDEPEND="dev-python/httplib2[${PYTHON_USEDEP}]
	|| ( dev-python/cchardet[${PYTHON_USEDEP}] dev-python/faust-cchardet[${PYTHON_USEDEP}] )"
DEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

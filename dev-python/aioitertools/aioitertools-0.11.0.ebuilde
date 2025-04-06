# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1 pypi
DESCRIPTION="itertools and builtins for AsyncIO and mixed iterables"
HOMEPAGE="https://aioitertools.omnilib.dev https://pypi.org/project/aioitertools/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

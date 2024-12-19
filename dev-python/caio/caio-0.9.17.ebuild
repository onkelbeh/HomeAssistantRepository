# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Asynchronous file IO for Linux MacOS or Windows."
HOMEPAGE="https://github.com/mosquito/caio https://pypi.org/project/caio/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"
src_prepare() {
	cp $S/README.md $S/README.rst
	default
}
python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

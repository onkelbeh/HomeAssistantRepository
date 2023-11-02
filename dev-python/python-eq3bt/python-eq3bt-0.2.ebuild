# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="EQ3 bluetooth thermostat support library"
HOMEPAGE="https://github.com/rytilahti/python-eq3bt.git https://pypi.org/project/python-eq3bt/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/click[${PYTHON_USEDEP}]
	dev-python/construct[${PYTHON_USEDEP}]
	dev-python/bleak[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -i -e '/include = \["CHANGELOG"\]/c\' pyproject.toml || die
	distutils-r1_src_prepare
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

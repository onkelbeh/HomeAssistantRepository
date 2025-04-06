# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Control Snapcast."
HOMEPAGE="https://github.com/happyleavesaoc/python-snapcast/ https://pypi.org/project/snapcast/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

#DOCS="README.md"

RDEPEND=">=dev-python/construct-2.5.2[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/construct-2.5.2[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

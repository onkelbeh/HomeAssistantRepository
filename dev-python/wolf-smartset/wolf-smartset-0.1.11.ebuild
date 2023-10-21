# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A package to communicate with Wolf Smart Set Cloud"
HOMEPAGE="https://github.com/adamkrol93/wolf-smartset https://pypi.org/project/wolf-smartset/"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test ) mirror"

DOCS="README.md"

RDEPEND="dev-python/httpx[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

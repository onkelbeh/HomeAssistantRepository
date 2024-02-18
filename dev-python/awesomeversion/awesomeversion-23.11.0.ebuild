# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="One version package to rule them all, One version package to find them, One version package to bring them all, and in the darkness bind them."
HOMEPAGE="https://github.com/ludeeus/awesomeversion https://pypi.org/project/awesomeversion/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

python_prepare_all() {
	# include = ["awesomeversion", "awesomeversion.*", "LICENCE.md"]
	sed -i -e 's:, "LICENCE.md"::' pyproject.toml || die
	# remove dynamic-versioning
	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	distutils-r1_python_prepare_all
}

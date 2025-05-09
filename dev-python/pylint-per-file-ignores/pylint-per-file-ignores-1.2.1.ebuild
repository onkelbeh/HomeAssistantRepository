# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A pylint plugin to ignore error codes per file."
HOMEPAGE="https://github.com/christopherpickering/pylint-per-file-ignores.git https://pypi.org/project/pylint-per-file-ignores/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="readme.md"

RDEPEND="$(python_gen_cond_dep 'dev-python/tomli[${PYTHON_USEDEP}]' python3_{9..10})"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Pytest Plugin to disable socket calls during tests"
HOMEPAGE="https://github.com/miketheman/pytest-socket/ https://pypi.org/project/pytest-socket/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/pytest-3.6.3[${PYTHON_USEDEP}]"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

src_prepare() {
	default
	cat pyproject.toml | grep -v "LICENSE" | grep -v "README.md" > x && mv x pyproject.toml
}

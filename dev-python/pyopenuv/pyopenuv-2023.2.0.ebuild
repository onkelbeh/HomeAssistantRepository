# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A simple Python API data from openuv.io"
HOMEPAGE="https://github.com/bachya/pyopenuv https://pypi.org/project/pyopenuv/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/asynctest-0.13.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		>=dev-python/pytest-7.2.0[${PYTHON_USEDEP}]
		>=dev-python/aresponses-2.1.6[${PYTHON_USEDEP}]
		>=dev-python/asynctest-0.13.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-aiohttp-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

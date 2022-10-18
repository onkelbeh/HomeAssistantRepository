# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="A simple Python API data from openuv.io"
HOMEPAGE="https://github.com/bachya/pyopenuv https://pypi.org/project/pyopenuv/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/asynctest-0.13.0[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.11.1[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pytest-6.2.5[${PYTHON_USEDEP}]
		>=dev-python/aresponses-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/asynctest-0.13.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-aiohttp-0.3.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

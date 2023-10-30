# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client for WLED."
HOMEPAGE="https://github.com/frenck/python-wled https://pypi.org/project/wled/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-22.1.0[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/cachetools-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/packaging[${PYTHON_USEDEP}]
	test? (
		dev-python/aresponses[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

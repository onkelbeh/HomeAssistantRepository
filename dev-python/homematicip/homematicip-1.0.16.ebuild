# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="An API for the homematicip cloud"
HOMEPAGE="https://github.com/hahn-th/homematicip-rest-api https://pypi.org/project/homematicip/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/requests-2.24.0[${PYTHON_USEDEP}]
		>=dev-python/websocket-client-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/websockets-8.1[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.6.2[${PYTHON_USEDEP}]
		>=dev-python/async-timeout-3.0.1[${PYTHON_USEDEP}]
		>=dev-python/aenum-2.2.4[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

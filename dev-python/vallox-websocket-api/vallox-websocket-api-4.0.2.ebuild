# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Vallox WebSocket API"
HOMEPAGE="https://github.com/yozik04/vallox_websocket_api https://pypi.org/project/vallox-websocket-api/"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/websockets-9.1[${PYTHON_USEDEP}]
		 <dev-python/websockets-12.0[${PYTHON_USEDEP}]
		 >=dev-python/construct-2.9.0[${PYTHON_USEDEP}]
		 <dev-python/construct-3.0.0[${PYTHON_USEDEP}]
		 dev-python/aiohttp[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/wheel[${PYTHON_USEDEP}]
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/asynctest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

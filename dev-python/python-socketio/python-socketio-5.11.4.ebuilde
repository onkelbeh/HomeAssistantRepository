# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Socket.IO server"
HOMEPAGE="https://github.com/miguelgrinberg/python-socketio/ https://pypi.org/project/python-socketio/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="asyncio-client client test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/bidict-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-4.8.0[${PYTHON_USEDEP}]
	client? (
		>=dev-python/requests-2.21.0
		>=dev-python/websocket-client-0.54.0
	)
	asyncio-client? (
		>=dev-python/aiohttp-3.4
	)"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

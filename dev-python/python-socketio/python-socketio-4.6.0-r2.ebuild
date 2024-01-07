# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Socket.IO server"
HOMEPAGE="https://github.com/miguelgrinberg/python-socketio/ https://pypi.org/project/python-socketio/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="asyncio_client client test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/bidict-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	dev-python/python-engineio[${PYTHON_USEDEP}]
	client? (
		  >=dev-python/requests-2.21.0
		  >=dev-python/websocket-client-0.54.0
		  )
	asyncio_client? (
		  >=dev-python/aiohttp-3.4
		  >=dev-python/websockets-7.0
		  )"
BDEPEND="
	test? (
		  dev-python/pytest[${PYTHON_USEDEP}]
		  dev-python/mock[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

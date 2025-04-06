# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Socket.IO server This is a release of 4.6.1 under the socketio_v4 namespace for old systems."
HOMEPAGE="https://github.com/bdraco/python-socketio-v4/ https://pypi.org/project/python-socketio-v4/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="asyncio_client client test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	dev-python/python-engineio[${PYTHON_USEDEP}]
	client? (
		  >=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
		  >=dev-python/websocket-client-0.54.0[${PYTHON_USEDEP}]
		  )
	asyncio_client? (
		  >=dev-python/aiohttp-3.4[${PYTHON_USEDEP}]
		  >=dev-python/websockets--7.0[${PYTHON_USEDEP}]
		  )"
BDEPEND="
	test? (
		  dev-python/mock[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

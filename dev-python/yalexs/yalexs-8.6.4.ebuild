# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="Python API for Yale Access (formerly August) Smart Lock and Doorbell"
HOMEPAGE="https://github.com/bdraco/yalexs https://pypi.org/project/yalexs/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/ciso8601-2.1.3[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.10.5[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-23[${PYTHON_USEDEP}]
	|| ( >=dev-python/freenub-0.1.0[${PYTHON_USEDEP}] dev-python/pubnub[${PYTHON_USEDEP}] )
	>=dev-python/typing-extensions-4.5.0[${PYTHON_USEDEP}]
	>=dev-python/python-socketio-5.11.3[asyncio-client,${PYTHON_USEDEP}]"

distutils_enable_tests pytest

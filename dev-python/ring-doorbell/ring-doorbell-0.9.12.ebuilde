# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="A Python library to communicate with Ring Door Bell (https://ring.com/)"
HOMEPAGE="https://github.com/tchellomello/python-ring-doorbell https://pypi.org/project/ring-doorbell/"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
	>=dev-python/oauthlib-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2022.0[${PYTHON_USEDEP}]
	>=dev-python/asyncclick-8.1.7.1[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-23.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-13.0.0[${PYTHON_USEDEP}]
	>=dev-python/firebase-messaging-0.4.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

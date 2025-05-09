# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="FCM/GCM push notification client"
HOMEPAGE="https://github.com/sdb9696/firebase-messaging https://pypi.org/project/firebase-messaging/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
	dev-python/protobuf[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/http-ece[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
"
distutils_enable_tests pytest

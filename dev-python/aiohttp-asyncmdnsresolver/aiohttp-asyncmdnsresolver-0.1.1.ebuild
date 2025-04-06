# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="An async resolver for aiohttp that supports MDNS"
HOMEPAGE="https://github.com/aio-libs/aiohttp-asyncmdnsresolver https://pypi.org/project/aiohttp-asyncmdnsresolver/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/aiodns-3.2.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.10.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.142.0[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest

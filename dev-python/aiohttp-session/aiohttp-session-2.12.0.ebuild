# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="sessions for aiohttp.web"
HOMEPAGE="https://github.com/aio-libs/aiohttp_session/ https://pypi.org/project/aiohttp-session/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="aioredis pycrypto pynacl secure test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	aioredis? ( ~dev-python/redis-4.3.1[${PYTHON_USEDEP}] )
	pycrypto? ( dev-python/cryptography[${PYTHON_USEDEP}] )
	secure? ( dev-python/cryptography[${PYTHON_USEDEP}] )
	pynacl? ( dev-python/pynacl[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest

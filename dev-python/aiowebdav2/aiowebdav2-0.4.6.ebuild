# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Async Python 3 client for WebDAV, based on aiowebdav"
HOMEPAGE="https://pypi.org/project/aiowebdav2/ https://github.com/jpbede/aiowebdav2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/lxml-5.3.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9.0_p0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.18.3[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

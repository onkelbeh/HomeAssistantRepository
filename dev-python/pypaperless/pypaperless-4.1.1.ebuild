# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Little api client for paperless(-ngx)."
HOMEPAGE="https://pypi.org/project/pypaperless/ https://github.com/tb1337/paperless-api"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/aiohttp-3.12.13[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.20.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

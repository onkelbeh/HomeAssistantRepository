# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Server Sent Events for Starlette and FastAPI"
HOMEPAGE="https://pypi.org/project/sse-starlette/ https://github.com/sysid/sse-starlette"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/anyio-4.7.0[${PYTHON_USEDEP}]
	>=dev-python/starlette-0.41.3[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

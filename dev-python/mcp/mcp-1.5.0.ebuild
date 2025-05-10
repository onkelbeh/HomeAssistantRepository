# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Model Context Protocol SDK"
HOMEPAGE="https://pypi.org/project/mcp/ https://github.com/modelcontextprotocol/python-sdk"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/anyio-4.5[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27[${PYTHON_USEDEP}]
	>=dev-python/httpx-sse-0.4[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7.2[${PYTHON_USEDEP}]
	>=dev-python/starlette-0.27[${PYTHON_USEDEP}]
	>=dev-python/sse-starlette-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.5.2[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.23.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

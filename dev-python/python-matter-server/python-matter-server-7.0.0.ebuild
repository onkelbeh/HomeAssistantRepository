# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python Matter WebSocket Server"
HOMEPAGE=" https://pypi.org/project/python-matter-server/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/aiohttp-3.11.11[${PYTHON_USEDEP}]
	>=dev-python/aiorun-2024.8.1[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-4.0.3[${PYTHON_USEDEP}]
	>=dev-python/atomicwrites-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/coloredlogs-15.0.1[${PYTHON_USEDEP}]
	>=dev-python/cryptography-44.0.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.0.16[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.136.2[${PYTHON_USEDEP}]
	~dev-python/home-assistant-chip-clusters-2024.11.4[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

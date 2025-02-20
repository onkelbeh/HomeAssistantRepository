# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Python API for TP-Link Kasa Smarthome devices"
HOMEPAGE="https://github.com/python-kasa/python-kasa https://pypi.org/project/python-kasa/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="docs shell +speedups test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/asyncclick-8.1.7[${PYTHON_USEDEP}]
	>=dev-python/cryptography-1.9.0[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/tzdata-2024.2[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.14[${PYTHON_USEDEP}]
	docs? (	dev-python/sphinx[${PYTHON_USEDEP}] dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] dev-python/sphinxcontrib-programoutput[${PYTHON_USEDEP}] dev-python/myst-parser[${PYTHON_USEDEP}] >=dev-python/docutils-0.17.0[${PYTHON_USEDEP}] )
	shell? ( dev-python/ptpython[${PYTHON_USEDEP}] dev-python/rich[${PYTHON_USEDEP}] )
	speedups? ( >=dev-python/orjson-3.9.1[${PYTHON_USEDEP}] >=dev-python/kasa-crypt-0.2.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-sugar[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

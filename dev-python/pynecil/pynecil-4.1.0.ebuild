# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Python library to communicate with Pinecil V2 soldering irons via Bluetooth"
HOMEPAGE="https://github.com/tr4nt0r/pynecil/ https://pypi.org/project/pynecil/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"
RDEPENDS="
	>=dev-python/mypy-1.15.0[${PYTHON_USEDEP}]
	>=dev-python/ruff-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-8.3.5[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/mkdocmaterial-9.6.9[${PYTHON_USEDEP}]
	>=dev-python/mkdocstrings-0.29.0[python,${PYTHON_USEDEP}]
	>=dev-python/pytest-asyncio-0.24.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

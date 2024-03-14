# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client for Internet Printing Protocol (IPP)."
HOMEPAGE="https://github.com/ctalkington/python-ipp https://pypi.org/project/pyipp/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.6.2[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-21.10.1[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/deepmerge-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/aresponses[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-freezegun[${PYTHON_USEDEP}]
		dev-python/freezegun[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

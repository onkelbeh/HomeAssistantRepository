# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="A simple Python 3 library for Notion Home Monitoring"
HOMEPAGE="https://github.com/bachya/aionotion https://pypi.org/project/aionotion/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2023.07.22[${PYTHON_USEDEP}]
	>=dev-python/ciso8601-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/frozenlist-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.12[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.2[${PYTHON_USEDEP}]

"
BDEPEND="
	test? (
		dev-python/aresponses[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

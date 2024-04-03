# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A simple Python API for Tile Bluetooth trackers"
HOMEPAGE="https://github.com/bachya/pytile https://pypi.org/project/pytile/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2023.07.22[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.2[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

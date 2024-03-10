# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Discover Unifi Devices"
HOMEPAGE="https://github.com/bdraco/unifi-discovery https://pypi.org/project/unifi-discovery/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/pyroute2-0.6.5[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/aioresponses[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

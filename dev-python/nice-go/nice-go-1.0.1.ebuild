# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Control various Nice access control products"
HOMEPAGE="https://IceBotYT.github.io/nice-go https://pypi.org/project/nice-go/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
	>=dev-python/aiobotocore-2.13.1[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.4[${PYTHON_USEDEP}]
	>=dev-python/pycognito-2024.5.1[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.5.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

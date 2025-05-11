# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="Interact with internal OverKiz API (e.g. used by Somfy TaHoma)"
HOMEPAGE="https://github.com/iMicknl/python-overkiz-api https://pypi.org/project/pyoverkiz/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/aiohttp-3.10.3[${PYTHON_USEDEP}]
	>=dev-python/pyhumps-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/attrs-21.2.0[${PYTHON_USEDEP}]
	>=dev-python/boto3-1.18.59[${PYTHON_USEDEP}]
	>=dev-python/warrant-lite-1.0.4[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Async Python 3 library for interacting with Discovergy smart meters API"
HOMEPAGE="https://github.com/jpbede/pydiscovergy https://pypi.org/project/pydiscovergy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/Authlib-0.15[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.24.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2023.3[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.11[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-3.19.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-httpx[${PYTHON_USEDEP}]
		dev-python/respx[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

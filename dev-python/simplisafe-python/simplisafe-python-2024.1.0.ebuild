# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A Python3, async interface to the SimpliSafe API"
HOMEPAGE="https://github.com/bachya/simplisafe-python https://pypi.org/project/simplisafe-python/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.11.1[${PYTHON_USEDEP}]
	>=dev-python/certifi-2023.7.22[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.11.7[${PYTHON_USEDEP}]
	>=dev-python/websockets-8.1[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/aioresponses[${PYTHON_USEDEP}]
		dev-python/asynctest[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

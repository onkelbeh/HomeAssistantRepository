# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi
DESCRIPTION="A clean, async-friendly library for the Ambient Weather API"
HOMEPAGE="https://github.com/bachya/aioambient/ https://pypi.org/project/aioambient/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2023.7.22[${PYTHON_USEDEP}]
	>=dev-python/python-socketio-4.6[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-3.13.1[${PYTHON_USEDEP}]
	>=dev-python/websockets-11.0.1[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/aresponses[${PYTHON_USEDEP}]
		dev-python/asynctest[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

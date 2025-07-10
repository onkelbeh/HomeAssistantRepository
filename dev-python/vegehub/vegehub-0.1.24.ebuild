# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="A basic package for simplifying interactions with the Vegetronix VegeHub"
HOMEPAGE="https://github.com/Thulrus/VegeHubPyPiLib https://pypi.org/project/vegehub/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

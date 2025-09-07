# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3_11 python3_{11..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client for Spotify."
HOMEPAGE="https://github.com/joostlek/python-spotify/ https://pypi.org/project/spotifyaio/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.11[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.10[${PYTHON_USEDEP}]"

BDEPEND="
	test? (
		dev-python/aioresponses[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-pyhton/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/yamlint[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

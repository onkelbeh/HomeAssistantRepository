# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python wrapper for the Discord API forked from discord.py"
HOMEPAGE="https://github.com/nextcord/nextcord https://pypi.org/project/nextcord/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"
RDEPEND="dev-python/pynacl[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

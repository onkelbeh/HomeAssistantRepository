# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client for LetPot hydroponic gardens."
HOMEPAGE="https://pypi.org/project/letpot/ https://github.com/jpelgrom/python-letpot"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/aiohttp-3.11[${PYTHON_USEDEP}]
	>=dev-python/aiomqtt-2.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="A package to control Snoos."
HOMEPAGE="https://pypi.org/project/python-snoo/ https://github.com/Lash-L/python-snoo"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	|| ( >=dev-python/freenub-0.1.0[${PYTHON_USEDEP}] dev-python/pubnub[${PYTHON_USEDEP}] )
	>=dev-python/mashumaro-3.15[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Python library for Miele integration with Home Assistant"
HOMEPAGE="https://pypi.org/project/pymiele/ https://github.com/nordicopen/pymiele"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

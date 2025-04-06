# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="Offers a Python API for the EHEIM Digital smart aquarium devices."
HOMEPAGE="
	https://pypi.org/project/eheimdigital/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

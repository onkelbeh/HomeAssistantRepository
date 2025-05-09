# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Home Assistant client for firmwares released with silabs-firmware-builder"
HOMEPAGE="https://pypi.org/project/ha-silabs-firmware-client/ https://github.com/home-assistant-libs/ha-silabs-firmware-client"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

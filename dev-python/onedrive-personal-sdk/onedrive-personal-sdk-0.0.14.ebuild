# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="A package to interact with the Microsoft Graph API for personal OneDrives."
HOMEPAGE="https://pypi.org/project/onedrive-personal-sdk/ https://github.com/zweckj/onedrive-personal-sdk"
PATCHES="${FILESDIR}/${P}-build-system.patch"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.9.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Python wrapper for the DoorBird LAN API v0.21"
HOMEPAGE="https://gitlab.com/klikini/doorbirdpy https://pypi.org/project/DoorBirdPy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/tenacity[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

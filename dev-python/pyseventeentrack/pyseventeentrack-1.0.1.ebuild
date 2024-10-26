# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="A Simple Python API for 17track.net"
HOMEPAGE="https://github.com/shaiu/pyseventeentrack https://pypi.org/project/pyseventeentrack/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND=">=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
	>=dev-python/attrs-19.3[${PYTHON_USEDEP}]
	>=dev-python/pytz-2021.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

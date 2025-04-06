# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Library to emulate a roku server to serve as a proxyfor remotes such as Harmony"
HOMEPAGE="https://gitlab.com/mindig.marton/emulated_roku https://pypi.org/project/emulated-roku/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/aiohttp-3.0.6[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

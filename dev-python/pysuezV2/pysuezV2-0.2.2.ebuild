# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Get your water consumption data from your Suez account (www.toutsurmoneau.fr or www.eau-olivet.fr)"
HOMEPAGE="https://github.com/jb101010-2/pySuez/ https://pypi.org/project/pysuezV2/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

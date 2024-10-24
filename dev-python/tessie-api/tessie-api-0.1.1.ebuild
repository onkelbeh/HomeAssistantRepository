# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="A small python package that wraps up the Tessie API"
HOMEPAGE="https://github.com/andrewgierens/tessie_python_api https://pypi.org/project/tessie-api/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]"

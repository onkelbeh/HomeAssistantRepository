# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1

DESCRIPTION="Python library for DIO Chacon wifi's protocol for shutters and switches"
HOMEPAGE="https://github.com/cnico/dio-chacon-wifi-api https://pypi.org/project/dio-chacon-wifi-api/"
SRC_URI="https://github.com/cnico/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.9.3[${PYTHON_USEDEP}]"
distutils_enable_tests pytest

# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Asynchronous library to retrieve data from PEGELONLINE."
HOMEPAGE="https://github.com/mib1185/aiopegelonline https://pypi.org/project/aiopegelonline/"
SRC_URI="https://github.com/mib1185/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

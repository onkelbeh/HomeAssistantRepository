# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="API for Tesla Powerwall"
HOMEPAGE="https://github.com/jrester/tesla_powerwall https://pypi.org/project/tesla-powerwall/"
MY_PN=${PN/-/_}
SRC_URI="https://github.com/jrester/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.18[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.0[${PYTHON_USEDEP}]"
BDEPEND=">=dev-python/packaging-20.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

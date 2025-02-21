# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="A aiohttp-based client for Intergas InComfort/InTouch Lan2RF systems"
HOMEPAGE="https://github.com/zxdavb/incomfort-client https://pypi.org/project/incomfort-client/"
SRC_URI="https://github.com/zxdavb/${PN}/archive/refs/tags/v${PVR/r/}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${PVR/r/}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
	>=dev-python/aioresponses-0.7.6[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="A python library to communicate with Read Your Meter Pro."
HOMEPAGE="https://github.com/OnFreund/pyrympro"
SRC_URI="https://github.com/OnFreund/pyrympro/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE=""

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"

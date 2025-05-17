# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Python client for several popular geocoding web services"
HOMEPAGE="https://github.com/geopy/geopy"
SRC_URI="https://github.com/geopy/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
# Need geocoding service to test
RESTRICT="test"

RDEPEND=">=dev-python/geographiclib-1.52[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

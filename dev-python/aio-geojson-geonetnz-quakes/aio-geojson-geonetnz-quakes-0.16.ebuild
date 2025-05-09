# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="An async GeoJSON client library for GeoNet NZ Quakes feed."
HOMEPAGE="https://github.com/exxamalte/python-aio-geojson-geonetnz-quakes https://pypi.org/project/aio-geojson-geonetnz-quakes/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	>=dev-python/pytz-2019.01[${PYTHON_USEDEP}]
	>=dev-python/aio-geojson-client-0.20[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

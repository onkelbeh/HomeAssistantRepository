# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Library used by Home Assistant to interact with the WeatherFlow RESTApi"
HOMEPAGE="https://github.com/jeeftor/weatherflow4py https://pypi.org/project/weatherflow4py/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/dataclasses-json-0.6.3[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.9.1[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-3.20.1[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python client to retrieve data provided by DWD via their geoserver WFS API"
HOMEPAGE="https://github.com/stephan192/dwdwfsapi https://pypi.org/project/dwdwfsapi/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/requests-2.23.0[${PYTHON_USEDEP}]
	<dev-python/requests-3[${PYTHON_USEDEP}]
	>=dev-python/ciso8601-2.1.3[${PYTHON_USEDEP}]
	<dev-python/ciso8601-3[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.8[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

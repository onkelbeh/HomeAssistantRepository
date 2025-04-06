# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A package to access meteorological data from Environment Canada"
HOMEPAGE="https://github.com/michaeldavie/env_canada https://pypi.org/project/env-canada/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	sci-geosciences/geopy[${PYTHON_USEDEP}]
	>=dev-python/imageio-2.28.0[${PYTHON_USEDEP}]
	>=dev-python/lxml-5.3.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.22.2[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.2.3[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.0.1[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.15.2[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

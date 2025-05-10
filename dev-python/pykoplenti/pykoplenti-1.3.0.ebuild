# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python REST-Client for Kostal Plenticore Solar Inverters"
HOMEPAGE="https://github.com/stegm/pyclient_koplenti https://pypi.org/project/pykoplenti/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.19.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

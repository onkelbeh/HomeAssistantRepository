# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="API to Netatmo weather station data from any Python 3 script"
HOMEPAGE="https://github.com/jabesq/pyatmo https://pypi.org/project/pyatmo/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	>=dev-python/oauthlib-3.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.24[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-1.3[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

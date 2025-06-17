# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A library for getting historical and forecasted from opower.com"
HOMEPAGE="https://github.com/tronikos/opower https://pypi.org/project/opower/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/aiohttp-3.8[${PYTHON_USEDEP}]
	>=dev-python/aiozoneinfo-0.1[${PYTHON_USEDEP}]
	>=dev-python/arrow-1.2[${PYTHON_USEDEP}]
	>=dev-python/cryptography-43.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

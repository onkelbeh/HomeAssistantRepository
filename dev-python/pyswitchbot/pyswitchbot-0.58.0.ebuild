# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A library to communicate with Switchbot"
HOMEPAGE="https://github.com/Danielhiversen/pySwitchbot/ https://pypi.org/project/PySwitchbot/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-3.4.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-39.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-23.0.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

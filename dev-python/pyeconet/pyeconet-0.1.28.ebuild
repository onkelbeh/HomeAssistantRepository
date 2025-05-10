# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Interface to the unofficial EcoNet API"
HOMEPAGE="https://github.com/w1ll1am23/pyeconet https://pypi.org/project/pyeconet/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/aiohttp-3.11.11[${PYTHON_USEDEP}]
	>=dev-python/paho-mqtt-2.1.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

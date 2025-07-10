# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python API for talking to a MySensors gateway"
HOMEPAGE="https://github.com/theolind/pymysensors https://pypi.org/project/pymysensors/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="mqtt test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/awesomeversion-25.5.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.8[${PYTHON_USEDEP}]
	>=dev-python/crcmod-1.7[${PYTHON_USEDEP}]
	>=dev-python/getmac-0.9.5[${PYTHON_USEDEP}]
	>=dev-python/intelhex-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/paho-mqtt-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	>=dev-python/pyserial-asyncio-fast-0.16[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.15.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

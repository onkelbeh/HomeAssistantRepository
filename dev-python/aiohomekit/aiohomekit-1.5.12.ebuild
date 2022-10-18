# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1

DESCRIPTION="An asyncio HomeKit client"
HOMEPAGE="https://github.com/Jc2k/aiohomekit https://pypi.org/project/aiohomekit/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/cryptography-2.9.2[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.32.0[${PYTHON_USEDEP}]
	>=dev-python/commentjson-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/aiocoap-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.17.0[${PYTHON_USEDEP}]
	>=dev-python/chacha20poly1305-reuseable-0.0.4[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-1.17.1[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.7.8[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-4.0.2[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/asynctest[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="A client library for Apple TV and AirPlay devices"
HOMEPAGE="https://github.com/postlund/pyatv/ https://pyatv.dev https://pypi.org/project/pyatv/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-4.0.2[${PYTHON_USEDEP}]
	>=dev-python/bitarray-2.1.2[${PYTHON_USEDEP}]
	>=dev-python/chacha20poly1305-reuseable-0.0.3[${PYTHON_USEDEP}]
	>=dev-python/cryptography-36.0.2[${PYTHON_USEDEP}]
	>=dev-python/ifaddr-0.1.7[${PYTHON_USEDEP}]
	>=dev-python/mediafile-0.8.1[${PYTHON_USEDEP}]
	>=dev-python/miniaudio-1.45[${PYTHON_USEDEP}]
	>=dev-python/protobuf-python-3.19.3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.23.0[${PYTHON_USEDEP}]
	>=dev-python/srptools-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.38.1[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

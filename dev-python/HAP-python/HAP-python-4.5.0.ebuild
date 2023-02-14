# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="HomeKit Accessory Protocol implementation in python"
HOMEPAGE="https://github.com/ikalchev/HAP-python https://pypi.org/project/HAP-python/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/chacha20poly1305-reuseable[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.7.2[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.36.2[${PYTHON_USEDEP}]
	dev-python/h11[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python library for interacting with Android TV using the Android TV Remote protocol v2"
HOMEPAGE="https://github.com/tronikos/androidtvremote2 https://pypi.org/project/androidtvremote2/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiofiles-0.8[${PYTHON_USEDEP}]
	>=dev-python/cryptography-3[${PYTHON_USEDEP}]
	>=dev-python/protobuf-python-4.21[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

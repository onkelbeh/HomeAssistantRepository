# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Yet another gRPC reflection client"
HOMEPAGE="https://github.com/sparky8512/yagrc https://pypi.org/project/yagrc/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/grpcio-1.12.0[${PYTHON_USEDEP}]
	>=dev-python/grpcio-reflection-1.7.3[${PYTHON_USEDEP}]
	>=dev-python/protobuf-4.22.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

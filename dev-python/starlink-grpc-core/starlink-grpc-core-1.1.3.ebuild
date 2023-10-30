# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1

DESCRIPTION="Core functions for Starlink gRPC communication"
HOMEPAGE="https://github.com/sparky8512/starlink-grpc-tools https://pypi.org/project/starlink-grpc-core/"
SRC_URI="https://github.com/sparky8512/starlink-grpc-tools/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/grpcio-1.12.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.6.0[${PYTHON_USEDEP}]
	>=dev-python/yagrc-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.3.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Status proto mapping for gRPC"
HOMEPAGE="https://grpc.io https://pypi.org/project/grpcio-status/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/protobuf-python-5.26.1[${PYTHON_USEDEP}]
	>=dev-python/grpcio-${PV}[${PYTHON_USEDEP}]
	>=dev-python/googleapis-common-protos-1.5.5[${PYTHON_USEDEP}]"
BDEPEND=">=dev-python/cython-3[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

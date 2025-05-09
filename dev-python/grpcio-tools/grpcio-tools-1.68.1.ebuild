# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Package for gRPC Python tools."
HOMEPAGE="https://pypi.org/project/grpcio-tools/ https://github.com/grpc/grpc/tree/master/tools/distrib/python/grpcio_tools"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

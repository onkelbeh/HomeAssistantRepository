# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Google Cloud Secret Manager API client library"
HOMEPAGE="
	https://pypi.org/project/google-cloud-secret-manager/
	https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-secret-manager
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-python/google-api-core[grpc,${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.14.1[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.25.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20.2[${PYTHON_USEDEP}]
	>=dev-python/grpc-google-iam-v1-0.14.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

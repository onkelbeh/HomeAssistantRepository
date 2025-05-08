# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Async client for aws services using botocore and aiohttp"
HOMEPAGE="https://github.com/aio-libs/aiobotocore https://pypi.org/project/aiobotocore/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="awscli boto3 test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/aiohttp-3.9.2[${PYTHON_USEDEP}] <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/wrapt-1.10.10[${PYTHON_USEDEP}] <dev-python/wrapt-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/botocore-1.34.70[${PYTHON_USEDEP}] <dev-python/botocore-1.34.132[${PYTHON_USEDEP}]
	>=dev-python/aioitertools-0.5.1[${PYTHON_USEDEP}] <dev-python/aioitertools-1.0.0[${PYTHON_USEDEP}]
	awscli? ( >=app-admin/awscli-1.32.7[${PYTHON_USEDEP}] <app-admin/awscli-1.33.14[${PYTHON_USEDEP}] )
	boto3? ( >=dev-python/boto3-1.34.70[${PYTHON_USEDEP}] <dev-python/boto3-1.34.132[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

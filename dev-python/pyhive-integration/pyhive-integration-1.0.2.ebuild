# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="A Python library to interface with the Hive API"
HOMEPAGE="
	https://pypi.org/project/pyhive-integration/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	!dev-python/pyhiveapi[${PYTHON_USEDEP}]
	>=dev-python/boto3-1.16.10[${PYTHON_USEDEP}]
	>=dev-python/botocore-1.19.10[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/pyquery[${PYTHON_USEDEP}]
	dev-python/unasync[${PYTHON_USEDEP}]
	dev-python/loguru[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

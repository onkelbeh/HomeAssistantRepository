# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Kusto Data Client"
HOMEPAGE="https://github.com/Azure/azure-kusto-python https://pypi.org/project/azure-kusto-data/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="aio pandas test"
RESTRICT="!test? ( test )"
REQUIRED_USE="pandas? ( aio )"

RDEPEND=">=dev-python/python-dateutil-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.13.0[${PYTHON_USEDEP}]
	>=dev-python/azure-identity-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/msal-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/ijson-3.1[${PYTHON_USEDEP}]
	>=dev-python/azure-core-1.11.0[${PYTHON_USEDEP}]
	aio? ( >=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}] >=dev-python/asgiref-3.2.3[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest

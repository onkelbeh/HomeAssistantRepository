# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Microsoft Azure Identity Library for Python"
HOMEPAGE="https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/identity/azure-identity https://pypi.org/project/azure-identity/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/azure-core-1.23.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.5[${PYTHON_USEDEP}]
	>=dev-python/msal-1.24.0[${PYTHON_USEDEP}]
	>=dev-python/msal-extensions-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

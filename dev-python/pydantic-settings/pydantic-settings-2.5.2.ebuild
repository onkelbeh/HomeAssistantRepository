# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="Settings management using pydantic"
HOMEPAGE="
	https://pypi.org/project/pydantic-settings/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="azure-key-vault toml yaml"
RDEPEND="
	>=dev-python/pydantic-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-0.21.0[${PYTHON_USEDEP}]
	yaml? ( >=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}] )
	toml? ( >=dev-python/tomli-2.0.1[${PYTHON_USEDEP}] )
	azure-key-vault? (
		>=dev-python/azure-keyvault-secrets-4.8.0[${PYTHON_USEDEP}]
		>=dev-python/azure-identity-1.16.0[${PYTHON_USEDEP}]
	)
"
BDEPEND=""

distutils_enable_tests pytest

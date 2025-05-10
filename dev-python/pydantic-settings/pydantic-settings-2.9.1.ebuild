# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Settings management using pydantic"
HOMEPAGE="https://pypi.org/project/pydantic-settings/ https://github.com/pydantic/pydantic-settings"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="aws-secrets-manager azure-key-vault gcp-secret-manager toml yaml"
RDEPEND="
	>=dev-python/pydantic-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/typing-inspection-0.4.0[${PYTHON_USEDEP}]
	yaml? ( >=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}] )
	toml? ( >=dev-python/tomli-2.0.1[${PYTHON_USEDEP}] )
	aws-secrets-manager? (
		>=dev-python/boto3-1.35.0[${PYTHON_USEDEP}]
		dev-python/boto3-stubs[secretsmanager,${PYTHON_USEDEP}]
	)
	azure-key-vault? (
		>=dev-python/azure-keyvault-secrets-4.8.0[${PYTHON_USEDEP}]
		>=dev-python/azure-identity-1.16.0[${PYTHON_USEDEP}]
	)
	gcp-secret-manager? ( >=dev-python/google-cloud-secret-manager-2.23.1[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

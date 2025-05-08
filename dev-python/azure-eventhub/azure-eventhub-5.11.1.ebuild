# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi
DESCRIPTION="Microsoft Azure Event Hubs Client Library for Python"
HOMEPAGE="https://pypi.org/project/azure-eventhub/ https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/eventhub/azure-eventhub"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" "${PV}" ".zip" )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/azure-core-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.1[${PYTHON_USEDEP}]
"
BDEPEND="app-arch/unzip"
src_unpack() {
	default
	pushd "${WORKDIR}" || die
	mv "azure-eventhub-${PV}" "azure_eventhub-${PV}"
	popd || die
}

distutils_enable_tests pytest

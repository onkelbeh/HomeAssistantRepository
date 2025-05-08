# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi
DESCRIPTION="Microsoft Azure Service Bus Client Library for Python"
HOMEPAGE="https://pypi.org/project/azure-servicebus/ https://github.com/Azure/azure-sdk-for-python"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" "${PV}" ".zip")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/azure-core-1.24.0[${PYTHON_USEDEP}]
	>=dev-python/isodate-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.1[${PYTHON_USEDEP}]
"
BDEPEND="app-arch/unzip"
src_unpack() {
	default
	mv "${WORKDIR}/azure-servicebus-${PV}" "${WORKDIR}/azure_servicebus-${PV}"
}

distutils_enable_tests pytest

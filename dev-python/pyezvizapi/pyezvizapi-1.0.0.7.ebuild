# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Pilot your Ezviz cameras with this module."
HOMEPAGE="https://pypi.org/project/pyezvizapi/ https://github.com/RenierM26/pyEzvizApi"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	~dev-python/pandas-2.2.3[${PYTHON_USEDEP}]
	>=dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}]
	~dev-python/xmltodict-0.14.2[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.21.0[${PYTHON_USEDEP}]
"
distutils_enable_tests pytest

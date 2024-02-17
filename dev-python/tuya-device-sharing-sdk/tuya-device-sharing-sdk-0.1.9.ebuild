# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="A Python sdk for Tuya Open API, which provides IoT capabilities, maintained by Tuya official"
HOMEPAGE="https://github.com/tuya/tuya-device-sharing-sdk https://pypi.org/project/tuya-device-sharing-sdk/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

src_prepare() {
	echo -ne "requests\npaho-mqtt\n" > requirements.txt
	eapply_user
}

RDEPEND="dev-python/paho-mqtt[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

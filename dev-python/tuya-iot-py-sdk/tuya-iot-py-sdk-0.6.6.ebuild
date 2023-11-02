# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="A Python sdk for Tuya Open API, which provides IoT capabilities, maintained by Tuya official"
HOMEPAGE="https://github.com/tuya/tuya-iot-app-sdk-python https://pypi.org/project/tuya-iot-py-sdk/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/paho-mqtt[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	dev-python/websocket-client[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

# packages=find_packages()
src_prepare() {
	echo -ne "paho-mqtt\nrequests\npycryptodome\nwebsocket-client\n" > requirements.txt || die
	eapply_user
}

distutils_enable_tests pytest

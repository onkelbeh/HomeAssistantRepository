# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A serial utility to communicate & flash code to Espressif ESP8266 & ESP32 chips."
HOMEPAGE="https://github.com/espressif/esptool https://pypi.org/project/esptool/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/bitstring-3.1.6[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.1.4[${PYTHON_USEDEP}]
	>=dev-python/ecdsa-0.16.0[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3.0[${PYTHON_USEDEP}]
	>=dev-python/reedsolomon-1.5.3[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/pip[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

# reedsolo>=1.5.3,<=1.5.4
src_prepare() {
	sed -i "s/reedsolo>=1.5.3,<=1.5.4/reedsolo>=1.5.3/g" -i setup.py || die
	eapply_user
}

distutils_enable_tests unittest

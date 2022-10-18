# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="CircuitPython driver for motor, stepper, and servo based on PCA9685."
HOMEPAGE="https://github.com/adafruit/Adafruit_CircuitPython_PCA9685 https://pypi.org/project/adafruit-circuitpython-pca9685/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/Adafruit-Blinka[${PYTHON_USEDEP}]
	dev-python/adafruit-circuitpython-busdevice[${PYTHON_USEDEP}]
	dev-python/adafruit-circuitpython-register[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
DESCRIPTION="CircuitPython bus device classes to manage bus sharing."
HOMEPAGE="https://github.com/adafruit/Adafruit_CircuitPython_BusDevice https://pypi.org/project/adafruit-circuitpython-busdevice/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/Adafruit-Blinka-7.0.0[${PYTHON_USEDEP}]
	dev-python/adafruit-circuitpython-typing[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

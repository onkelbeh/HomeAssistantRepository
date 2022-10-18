# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

MY_PN=${PN/-/_}
DESCRIPTION="PCA9685 PWM servo/LED controller with a Raspberry Pi or BeagleBone Black."
HOMEPAGE="https://github.com/adafruit/Adafruit_Python_PCA9685/ https://pypi.org/project/Adafruit-PCA9685/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S="${WORKDIR}/${MY_PN}-${PV}"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

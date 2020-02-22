# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

MY_PN=${PN/-/_}
DESCRIPTION="PCA9685 PWM servo/LED controller with a Raspberry Pi or BeagleBone Black."
HOMEPAGE="https://github.com/adafruit/Adafruit_Python_PCA9685/ https://pypi.org/project/Adafruit-PCA9685/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm64"
IUSE="test"

RDEPEND=""
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S="${WORKDIR}/${MY_PN}-${PV}"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

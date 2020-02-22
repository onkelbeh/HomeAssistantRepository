# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="GPIO interface on the Raspberry Pi."
HOMEPAGE="https://github.com/adafruit/Adafruit_Python_GPIO/ https://pypi.org/project/Adafruit-GPIO/"
MY_PN=${PN/-/_}
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm64"
IUSE="test"

RDEPEND="dev-python/Adafruit-PureIO[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Python library to control Wi-Fi enabled iRobot Roomba vacuum cleaners"
HOMEPAGE="https://github.com/pschmitt/roombapy https://pypi.org/project/roombapy/"
SRC_URI="https://github.com/pschmitt/roombapy/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test +opencv pillow mqtt"

RDEPEND=">=dev-python/appdirs-1.4.3[${PYTHON_USEDEP}]
	>=dev-python/olefile-0.44[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	mqtt? ( dev-python/paho-mqtt[${PYTHON_USEDEP}] )
	>=dev-python/pyparsing-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
	opencv? ( =media-libs/opencv-3.4.1-r7[${PYTHON_USEDEP}]
			  >=dev-python/numpy-1.12.1[${PYTHON_USEDEP}] )
	pillow? ( >=dev-python/pillow-4.1.1[${PYTHON_USEDEP}] )"

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

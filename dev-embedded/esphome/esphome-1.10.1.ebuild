# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Make creating custom firmwares for ESP32/ESP8266 super easy."
HOMEPAGE="https://github.com/esphome/esphome https://pypi.org/project/esphome/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=""
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-1.4[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.11.1[${PYTHON_USEDEP}]
	>=dev-embedded/platformio-3.5.3
	>=dev-python/pyyaml-3.12[${PYTHON_USEDEP}]
	>=dev-python/paho-mqtt-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/colorlog-3.1.2[${PYTHON_USEDEP}]
	>=www-servers/tornado-5.0.0[${PYTHON_USEDEP}]
	>=dev-embedded/esptool-2.3.1[${PYTHON_USEDEP}]
	>=dev-python/typing-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-python-3.4[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3.4[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

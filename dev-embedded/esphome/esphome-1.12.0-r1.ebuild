# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit readme.gentoo-r1 distutils-r1

MY_P=${P/_beta/b}
MY_PV=${PV/_beta/b}

DESCRIPTION="Make creating custom firmwares for ESP32/ESP8266 super easy."
HOMEPAGE="https://github.com/esphome/esphome https://pypi.org/project/esphome/"

SRC_URI="https://github.com/esphome/esphome/archive/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="server test"

RDEPEND=""
DEPEND="${RDEPEND}
	server? ( acct-group/${PN} acct-user/${PN} )
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.11.5[${PYTHON_USEDEP}]
	>=dev-embedded/platformio-3.6.5
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	>=dev-python/paho-mqtt-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/colorlog-3.1.2[${PYTHON_USEDEP}]
	>=www-servers/tornado-5.1.1[${PYTHON_USEDEP}]
	>=dev-embedded/esptool-2.6[${PYTHON_USEDEP}]
	>=dev-python/typing-3.6.6[${PYTHON_USEDEP}]
	>=dev-python/protobuf-python-3.7[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3.4[${PYTHON_USEDEP}]
	>=dev-python/ifaddr-0.1.6[${PYTHON_USEDEP}]
	server? ( >=dev-python/ifaddr-0.1.6 )
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
The ESPHome dashboard listens on port 6052
ESPHome configuration is in: /etc/${PN}
dashboard command line arguments are configured in: /etc/conf.d/${PN}
logging is to: /var/log/${PN}/{dashboard,warnings}.log
support at https://git.edevau.net/onkelbeh/HomeAssistantRepository
"

S="${WORKDIR}/${MY_P}"

DOCS="README.md"

python_install_all() {
	dodoc ${DOCS}
	distutils-r1_python_install_all
	if use server; then
		keepdir "/etc/${PN}"
		fowners -R "${PN}:${PN}" "/etc/${PN}"
		keepdir "/var/log/${PN}"
		fowners -R "${PN}:${PN}" "/var/log/${PN}"
		newconfd "${FILESDIR}/${PN}.conf.d" "${PN}"
		newinitd "${FILESDIR}/${PN}.init.d-r1" "${PN}"
		readme.gentoo_create_doc
	fi
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

pkg_postinst() {
	if use server; then
		readme.gentoo_print_elog
	fi
}

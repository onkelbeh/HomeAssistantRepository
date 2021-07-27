# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_SINGLE_IMPL=1

inherit readme.gentoo-r1 distutils-r1

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/esphome/esphome.git"
	EGIT_BRANCH="dev"
	S="${WORKDIR}/${P}/"
else
	MY_P=${P/_beta/b}
	MY_PV=${PV/_beta/b}
	SRC_URI="https://github.com/${PN}/${PN}/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"
	#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_P}.tar.gz"
	S="${WORKDIR}/${MY_P}/"
fi

DESCRIPTION="Make creating custom firmwares for ESP32/ESP8266 super easy."
HOMEPAGE="https://github.com/esphome/esphome https://pypi.org/project/esphome/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm arm64 x86 ~amd64-linux ~x86-linux"
IUSE="+server test"

DOCS="README.md"

RDEPEND="
	server? ( acct-group/${PN} acct-user/${PN} )
	$(python_gen_cond_dep '
	  ~dev-python/voluptuous-0.12.1[${PYTHON_USEDEP}]
	  ~dev-python/pyyaml-5.4.1[${PYTHON_USEDEP}]
	  ~dev-python/paho-mqtt-1.5.1[${PYTHON_USEDEP}]
	  ~dev-python/colorama-0.4.4[${PYTHON_USEDEP}]
	  server? ( ~www-servers/tornado-6.1[${PYTHON_USEDEP}] )
	  ~dev-libs/protobuf-3.17.3
	  ~dev-python/protobuf-python-3.17.3[${PYTHON_USEDEP}]
	  ~dev-python/tzlocal-2.1[${PYTHON_USEDEP}]
	  ~dev-python/pytz-2021.1[${PYTHON_USEDEP}]
	  ~dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	  server? ( ~dev-python/ifaddr-0.1.7[${PYTHON_USEDEP}] )
	  ~dev-embedded/platformio-5.1.1
	  ~dev-embedded/esptool-2.8[${PYTHON_USEDEP}]
	  ~dev-python/click-7.1.2[${PYTHON_USEDEP}]
	  ~dev-embedded/esphome-dashboard-20210719.0[${PYTHON_USEDEP}]
	')"

BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools[${PYTHON_MULTI_USEDEP}]
		test? (
			dev-python/nose[${PYTHON_MULTI_USEDEP}]
			dev-python/pytest[${PYTHON_MULTI_USEDEP}]
			dev-python/pytest-cov[${PYTHON_MULTI_USEDEP}]
			dev-python/pytest-mock[${PYTHON_MULTI_USEDEP}]
			dev-python/pytest-asyncio[${PYTHON_MULTI_USEDEP}]
			dev-python/asyncmock[${PYTHON_MULTI_USEDEP}]
			dev-python/hypothesis[${PYTHON_MULTI_USEDEP}]
			)
	')"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
The ESPHome dashboard listens on port 6052
ESPHome configuration is in: /etc/${PN}
dashboard command line arguments are configured in: /etc/conf.d/${PN}
logging is to: /var/log/${PN}/{dashboard,warnings}.log
support at https://git.edevau.net/onkelbeh/HomeAssistantRepository
"

python_install_all() {
	dodoc ${DOCS}
	distutils-r1_python_install_all
	if use server; then
		keepdir "/etc/${PN}"
		fowners -R "${PN}:${PN}" "/etc/${PN}"
		keepdir "/var/log/${PN}"
		fowners -R "${PN}:${PN}" "/var/log/${PN}"
		newconfd "${FILESDIR}/${PN}.conf.d" "${PN}"
		newinitd "${FILESDIR}/${PN}.init.d-r2" "${PN}"
		readme.gentoo_create_doc
	fi
}

pkg_postinst() {
	if use server; then
		readme.gentoo_print_elog
	fi
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

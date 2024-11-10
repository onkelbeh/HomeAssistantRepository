# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_SINGLE_IMPL=1
PYTHON_COMPAT=( python3_{11..13} )

inherit readme.gentoo-r1 distutils-r1

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/esphome/esphome.git"
	EGIT_BRANCH="dev"
	S="${WORKDIR}/${P}/"
else
	inherit pypi
	MY_P=${P/_beta/b}
	MY_PV=${PV/_beta/b}
	S="${WORKDIR}/${MY_P}/"
fi

DESCRIPTION="Make creating custom firmwares for ESP32/ESP8266 super easy."
HOMEPAGE="https://github.com/esphome/esphome https://pypi.org/project/esphome/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="+server test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	server? ( acct-group/${PN} acct-user/${PN} )
	$(python_gen_cond_dep '
		dev-python/cryptography[${PYTHON_USEDEP}]
		dev-python/voluptuous[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
		~dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}]
		~dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
		dev-python/icmplib[${PYTHON_USEDEP}]
		server? ( ~dev-python/tornado-6.4.1[${PYTHON_USEDEP}] )
		~dev-python/tzlocal-5.2[${PYTHON_USEDEP}]
		>=dev-python/tzdata-2021.1[${PYTHON_USEDEP}]
		~dev-python/pyserial-3.5[${PYTHON_USEDEP}]
		~dev-embedded/platformio-6.1.15[${PYTHON_SINGLE_USEDEP}]
		~dev-embedded/esptool-4.7.0[${PYTHON_SINGLE_USEDEP}]
		~dev-python/click-8.1.7[${PYTHON_USEDEP}]
		~dev-embedded/esphome-dashboard-20240620.0[${PYTHON_USEDEP}]
		dev-python/aioesphomeapi[${PYTHON_USEDEP}]
		dev-python/zeroconf[${PYTHON_USEDEP}]
		~dev-python/puremagic-1.28[${PYTHON_USEDEP}]
		~dev-python/ruamel-yaml-0.18.6[${PYTHON_USEDEP}]
		~dev-python/kconfiglib-13.7.1[${PYTHON_USEDEP}]
		>=dev-python/pyparsing-3.0[${PYTHON_USEDEP}]
		>=dev-python/argcomplete-2.0.0[${PYTHON_USEDEP}]
	')"

BDEPEND="$(python_gen_cond_dep '
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/asyncmock[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
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

src_prepare() {
	sed "/aioesphomeapi==/c\aioesphomeapi" -i requirements.txt || die
	sed "/click==/c\click" -i requirements.txt || die
	sed "/tornado==/c\tornado" -i requirements.txt || die
	sed "/colorama==/c\colorama" -i requirements.txt || die
	sed "/zeroconf==/c\zeroconf" -i requirements.txt || die
	sed "/voluptuous==/c\voluptuous" -i requirements.txt || die
	sed "/cryptography==/c\cryptography" -i requirements.txt || die
	sed "/icmplib==/c\icmplib" -i requirements.txt || die
	sed "/pyyaml==/c\pyyaml" -i requirements.txt || die
	sed "/puremagic==/c\puremagic" -i requirements.txt || die

	# esphome/components/font/__init__.py pillow version check
	sed "s/10.2.0/10.3.0/g" -i esphome/components/font/__init__.py || die

	eapply_user
}

python_install_all() {
	dodoc ${DOCS}
	distutils-r1_python_install_all
	if use server; then
		keepdir "/etc/${PN}"
		fowners -R "${PN}:${PN}" "/etc/${PN}"
		keepdir "/var/log/${PN}"
		fowners -R "${PN}:${PN}" "/var/log/${PN}"
		newconfd "${FILESDIR}/${PN}.conf.d" "${PN}"
		newinitd "${FILESDIR}/${PN}.init.d-r3" "${PN}"
		readme.gentoo_create_doc
	fi
}

pkg_postinst() {
	if use server; then
		readme.gentoo_print_elog
	fi
}

distutils_enable_tests pytest

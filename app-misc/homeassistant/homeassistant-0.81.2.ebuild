# Copyright 1999-2018 Gentoo Foundation
# Ebuild (C)2018 OnkelBeh
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python3_5 python3_6 )

inherit user readme.gentoo-r1 eutils distutils-r1

DESCRIPTION="Open-source home automation platform running on Python 3.6"
HOMEPAGE="https://home-assistant.io"
SRC_URI="https://github.com/home-assistant/home-assistant/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="atv hs100 maint tradfri wemo mysql musiccast samsungtv"

DEPEND="
	${PYTHON_DEPS}
	!app-misc/homeassistant-bin
	>=dev-python/aiohttp-3.4.4[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/astral-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/async_timeout-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/attrs-18.2.0[${PYTHON_USEDEP}]
	>=dev-python/attrs-18.2.0[${PYTHON_USEDEP}]
	>=dev-python/bcrypt-3.1.4[${PYTHON_USEDEP}]
	>=dev-python/boto3-1.9.16[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup-4.5.1[${PYTHON_USEDEP}]
	>=dev-python/certifi-2018.4.16[${PYTHON_USEDEP}]
	>=dev-python/chardet-3.0.4[${PYTHON_USEDEP}]
	>=dev-python/colorlog-3.1.4[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.3.1[${PYTHON_USEDEP}]
	>=dev-python/idna-ssl-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.10[${PYTHON_USEDEP}]
	>=dev-python/paho-mqtt-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/pip-9.0.1[${PYTHON_USEDEP}]
	>=dev-python/pytz-2018.04[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.13[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
	>=dev-python/typing-3.6.2-r1[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.22[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.11.5[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-serialize-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.40.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.1.1[${PYTHON_USEDEP}]
	atv? ( >=dev-python/pyatv-0.3.9[${PYTHON_USEDEP}] )
	musiccast? ( >=dev-python/pymusiccast-0.1.6[${PYTHON_USEDEP}] )
	samsungtv? ( >=dev-python/samsungctl-0.7.1[${PYTHON_USEDEP}] )
	mysql? ( dev-python/mysqlclient[${PYTHON_USEDEP}] )
	hs100? ( >=dev-python/pyhs100-0.3.0[${PYTHON_USEDEP}] )
	tradfri? ( >=dev-python/pytradfri-4.1.0[${PYTHON_USEDEP}]
		 sys-devel/autoconf )
	wemo? ( >=dev-python/pywemo-0.4.25[${PYTHON_USEDEP}] )
	dev-db/sqlite
	dev-libs/libfastjson
	dev-libs/openssl
"

RDEPEND="
	${DEPEND}
	app-admin/logrotate
	maint? (
		app-crypt/certbot
		app-crypt/ssl-cert-check
		net-misc/dropbox-uploader
	)
"

INSTALL_DIR="/opt/${PN}"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
 The HA interface listens on port 8123 - this _will_ take a minute or two to appear

 hass configuration is in: /etc/${MY_PN}
 daemon command line arguments are configured in: /etc/conf.d/${MY_PN}

 logging is to: /var/log/${MY_PN}/{server,errors,stdout}.log

 The sqlite db is by default in: /etc/${MY_PN}
 To move it after ${MY_PN} has run once and while ${MY_PN} is stopped:
   - add /etc/${MY_PN}/recorder.yaml to /etc/${MY_PN}/configuration.yaml
   - mv /etc/${MY_PN}/home-assistant_v2.db /var/db/${MY_PN}

 support thread at:
	https://community.home-assistant.io/t/gentoo-homeassistant-0-59-2-ebuild/35577
"

S="${WORKDIR}/home-assistant-${PV}"

DOCS="README.rst"

pkg_setup() {
	enewgroup "${PN}"
	enewuser "${PN}" -1 -1 "$INSTALL_DIR" "${PN}"
}

src_prepare() {
	sed -e 's;astral==1.5;astral>=1.5;' \
		-i "setup.py" \
		-i homeassistant/package_constraints.txt

	eapply_user
}

python_install_all() {
	dodoc ${DOCS}
	distutils-r1_python_install_all

	keepdir "$INSTALL_DIR"

	keepdir "/etc/${PN}"
	fowners -R "${PN}:${PN}" "/etc/${PN}"

	newconfd "${FILESDIR}/${PN}.conf.d" "${PN}"
	newinitd "${FILESDIR}/${PN}.init.d" "${PN}"

	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}

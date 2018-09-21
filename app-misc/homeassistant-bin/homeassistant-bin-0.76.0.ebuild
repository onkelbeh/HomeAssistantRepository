# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python3_5 python3_6 )

inherit user readme.gentoo-r1 eutils distutils-r1 systemd

MY_PN="${PN/-bin/}"

DESCRIPTION="Home automation platform (Python 3 required)"
HOMEPAGE="https://home-assistant.io"
SRC_URI=""  # pip installs HA version $PV from PyPI

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="maint"

DEPEND="
	${PYTHON_DEPS}
	!app-misc/homeassistant
	>=dev-lang/python-3.5.4
	dev-python/pip[${PYTHON_USEDEP}]
	dev-python/virtualenv[${PYTHON_USEDEP}]
"
RDEPEND="
	${DEPEND}
	app-admin/logrotate
	maint? (
		app-crypt/certbot
		app-crypt/ssl-cert-check
		net-misc/dropbox-uploader
		virtual/logger
	)
"

INSTALL_DIR="/opt/${MY_PN}"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
 The HA interface listens on port 8123 - this _will_ take a minute or two to appear

 hass configuration is in: /etc/${MY_PN}
 For openrc daemon command line arguments are configured in: /etc/conf.d/${MY_PN}

 logging is to: /var/log/${MY_PN}/{server,errors,stdout}.log

 The sqlite db is by default in: /etc/${MY_PN}
 To move it after ${MY_PN} has run once and while ${MY_PN} is stopped:
   - add /etc/${MY_PN}/recorder.yaml to /etc/${MY_PN}/configuration.yaml
   - mv /etc/${MY_PN}/home-assistant_v2.db /var/db/${MY_PN}

 support thread at:
	https://community.home-assistant.io/t/gentoo-homeassistant-0-59-2-ebuild/35577

 The script /usr/bin/update-homeassistant can be used to update homeassistant-bin (it keeps
 a backup of the previous virtualenv under /opt). The script is for openrc only at the moment.
"

S="${WORKDIR}"

pkg_setup() {
	enewgroup "${MY_PN}"
	enewuser "${MY_PN}" -1 -1 "$INSTALL_DIR" "${MY_PN}"
}

src_compile() {
	true
}

src_install() {
	dobin "${FILESDIR}/update-homeassistant"

	keepdir "$INSTALL_DIR"

	keepdir "/etc/${MY_PN}"
	insinto "/etc/${MY_PN}"
	doins "${FILESDIR}/recorder.yaml"
	fowners -R "${MY_PN}:${MY_PN}" "/etc/${MY_PN}"

	python3.5 -m venv "${D}/$INSTALL_DIR"
	# for no output from pip add: --quiet
	# note the venv has a python3, but no python3.5
	VIRTUAL_ENV="$INSTALL_DIR" "${D}/$INSTALL_DIR/bin/python3" -m pip --no-cache-dir install "${MY_PN}==${PV}"
	sed -i "1c#!$INSTALL_DIR/bin/python3" "${D}/$INSTALL_DIR/bin/hass"
	fowners -R "${MY_PN}:${MY_PN}" "$INSTALL_DIR"

	newconfd "${FILESDIR}/${MY_PN}.conf.d" "${MY_PN}"
	newinitd "${FILESDIR}/${MY_PN}.init.d" "${MY_PN}"

	insinto /etc/logrotate.d
	newins "${FILESDIR}/${MY_PN}.logrotate" "${MY_PN}"

	keepdir "/var/log/${MY_PN}/old"
	fowners -R "${MY_PN}:${MY_PN}" "/var/log/${MY_PN}"

	keepdir "/var/db/${MY_PN}"
	fowners -R "${MY_PN}:${MY_PN}" "/var/db/${MY_PN}"

	systemd_dounit "${FILESDIR}"/${MY_PN}.service

	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}

pkg_config() {
	"${INSTALL_DIR}/bin/hass" --script ensure_config
}

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/Koenkk/zigbee2mqtt"
	EGIT_BRANCH="dev"
	inherit git-r3
else
	SRC_URI="https://github.com/Koenkk/zigbee2mqtt/archive/${PV}.tar.gz -> ${P}.tar.gz
		https://raw.githubusercontent.com/inode64/inode64-overlay/main/dist/${P}-node_modules.tar.xz"
fi

inherit nodejs nodejs-pack systemd tmpfiles

DESCRIPTION="It bridges events and allows you to control your Zigbee devices via MQTT"
HOMEPAGE="https://www.zigbee2mqtt.io/"
COMMIT="eb878d3d8ee47f77e27c771452e2d2c77ca83bb5"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	acct-group/zigbee2mqtt
	acct-user/zigbee2mqtt
	app-misc/mosquitto
"

NODEJS_EXTRA_FILES="scripts"

src_install() {
	echo "${COMMIT}" > dist/.hash

	echo -e "\nadvanced:" >>data/configuration.yaml
	echo -e "  network_key: GENERATE" >>data/configuration.yaml
	echo -e "  pan_id: GENERATE" >>data/configuration.yaml
	echo -e "  log_directory: /var/log/${PN}" >>data/configuration.yaml

	enpm_clean
	enpm_install

	keepdir /var/log/${PN}

	insinto /var/lib/${PN}
	doins data/configuration.yaml

	dotmpfiles "${FILESDIR}"/zigbee2mqtt.conf

	doinitd "${FILESDIR}"/${PN}
	systemd_dounit "${FILESDIR}/${PN}.service"

	dodir /etc/env.d
	echo 'CONFIG_PROTECT="/var/lib/${PN}"' >>"${ED}"/etc/env.d/90${PN} || die
}

pkg_postinst() {
	tmpfiles_process zigbee2mqtt.conf
}

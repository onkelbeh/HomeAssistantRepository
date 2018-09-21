# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/ssh/ssh-0.ebuild,v 1.5 2014/03/31 20:31:02 ulm Exp $

EAPI=5
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="68"
K_DEBLOB_AVAILABLE="1"
K_KDBUS_AVAILABLE="0"
inherit eutils
inherit kernel-2
detect_version
detect_arch

DESCRIPTION="binary kernel"
HOMEPAGE="http://dev.gentoo.org/~mpagano/genpatches"
KEYWORDS="amd64"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI}"
IUSE="deblob experimental"

DEPEND="sys-kernel/genkernel
	sys-boot/grub:2
	"

MY_PR=$( echo "${PVR}" | /bin/sed -e "s/^.*\\(-r[0-9+]\\)$/\1/" -e "/^[^-]/d" )

if [ ! -f "/boot/grub/grub.cfg" ]; then
	ewarn ""
	ewarn "************************************************"
	ewarn "/boot/grub/grub.cfg NOT FOUND - ABORTING"
	ewarn "ist /boot gemountet???"
	ewarn "************************************************"
	ewarn ""
	sleep 3600
	return 255
fi

kernel-2_src_install() {
	install_universal
	[[ ${ETYPE} == headers ]] && install_headers
	[[ ${ETYPE} == sources ]] && install_sources
	mkdir -p "${D}/var/log/" "${D}/boot/" "${D}/etc/modprobe.d/" "${D}/var/cache/genkernel/3.5.3.3/" 
	cp -av /var/cache/genkernel/*.bz2 "${D}/var/cache/genkernel/3.5.3.3/" 
	/usr/bin/genkernel --oldconfig --install --makeopts="-j20 -l10" --lvm --mdadm all \
	  --no-save-config \
	  --kernel-config="${FILESDIR}/config-${PVR}" \
	  --kerneldir="${D}/usr/src/linux-${PV}-kernel${MY_PR}/" \
	  --module-prefix="${D}/" \
	  --bootdir="${D}/boot/" \
	  --modprobedir="${D}/etc/modprobe.d/" \
	  --logfile="${D}/var/log/genkernel-${PVR}.log"
	cd "${D}/usr/src/linux-${PV}-kernel${MY_PR}/"
	pwd
	/usr/bin/make clean ${xmakeopts}
	# /usr/bin/eselect kernel set linux-${PV}-kernel${MY_PR}
	mv -v "${D}/lib/firmware" "${D}/lib/firmware-${PVR}"
}

pkg_postinst() {
	#cp -av "${FILESDIR}/config-${PV} ${D}
	kernel-2_pkg_postinst

	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
	cp -a "/boot/grub/grub.cfg" "/boot/grub/grub.cfg.BAK-$(/bin/date +%F-%T)"
	/usr/sbin/grub-mkconfig -o /boot/grub/grub.cfg 
	# rm -R /lib/firmware
	# ln -s "/lib/firmware-${PVR}" "/lib/firmware"
	/usr/bin/eselect kernel set linux-${PV}-kernel${MY_PR}
}

pkg_postrm() {
	kernel-2_pkg_postrm
	/usr/sbin/grub-mkconfig -o /boot/grub/grub.cfg
}

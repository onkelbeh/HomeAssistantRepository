# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi
DESCRIPTION="Python library for driving the Pimoroni BME680 Breakout"
HOMEPAGE="https://www.pimoroni.com https://pypi.org/project/bme680/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/smbus2[${PYTHON_USEDEP}]"
src_prepare() {	
	eapply "${FILESDIR}/fix-install.patch"
	eapply_user
}
src_install() {
	rm ${S}/LICENSE
	rm ${S}/CHANGELOG.md
	rm ${S}/README.md
	default
}

distutils_enable_tests pytest

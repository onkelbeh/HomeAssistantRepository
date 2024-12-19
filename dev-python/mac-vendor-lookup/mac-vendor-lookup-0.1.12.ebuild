# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Find the vendor for a given MAC address"
HOMEPAGE="https://github.com/bauerj/mac_vendor_lookup https://pypi.org/project/mac-vendor-lookup/"
MY_PN=${PN//-/_}
COMMIT="90dbea48f8a9d567b5f9039ebd151ddfe7d12a19"
SRC_URI="https://github.com/bauerj/${MY_PN}/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz
		 https://hasf.edevau.net/m/mac-vendors/mac-vendors-${PV}.txt.xz"
S="${WORKDIR}/${MY_PN}-${COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

src_prepare() {
	xzcat "${DISTDIR}/mac-vendors-${PV}.txt.xz" > "${S}/mac-vendors.txt" || die
	eapply_user
}

distutils_enable_tests pytest

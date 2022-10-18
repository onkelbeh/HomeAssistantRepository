# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Async ModBus python library"
HOMEPAGE="https://github.com/tiagocoutinho/async_modbus https://pypi.org/project/async-modbus/"
MY_PN=${PN/-/_}
SRC_URI="https://github.com/tiagocoutinho/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S=${WORKDIR}/${MY_PN}-${PV}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/connio-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/uModbus-1.0.4[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

src_prepare() {
	sed -i "s/packages = find:/packages = async_modbus/g" -i setup.cfg || die
	eapply_user
}
distutils_enable_tests pytest

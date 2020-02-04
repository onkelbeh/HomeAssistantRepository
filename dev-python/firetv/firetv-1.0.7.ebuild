# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Communicate with an Amazon Fire TV device via ADB over a network."
HOMEPAGE="https://github.com/happyleavesaoc/python-firetv/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux"
IUSE="test"

DEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	>=dev-python/rsa-4.0[${PYTHON_USEDEP}]
	>=dev-python/adb-homeassistant-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/libusb1-1.7[${PYTHON_USEDEP}]
"

python_test() {
	py.test -v || die "Tests failed under ${EPYTHON}"
}

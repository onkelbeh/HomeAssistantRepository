# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="A pure python implementation of the Android ADB and Fastboot protocols"
HOMEPAGE="https://github.com/google/python-adb"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/libusb1-1.0.16[${PYTHON_USEDEP}]
		 dev-python/rsa[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

python_test() {
	py.test -v || die "Tests failed under ${EPYTHON}"
}

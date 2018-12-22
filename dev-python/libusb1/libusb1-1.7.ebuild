# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Pure-python wrapper for libusb-1.0"
HOMEPAGE="http://github.com/vpelletier/python-libusb1"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"
SRC_URI="https://files.pythonhosted.org/packages/9c/51/25f5218d9e21bac3e36bb7167d7d9dfe899cd48bebfe60a54cd39c5db585/libusb1-1.7.tar.gz"

LICENSE="LGPLv2+"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86 ~amd64-fbsd ~amd64-linux ~x86-linux"
IUSE="test"

DEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

python_test() {
	py.test -v || die "Tests failed under ${EPYTHON}"
}

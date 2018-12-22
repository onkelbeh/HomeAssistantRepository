# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="A pure python implementation of the Android ADB and Fastboot protocols"
HOMEPAGE="https://github.com/google/python-adb"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"
SRC_URI="https://files.pythonhosted.org/packages/54/82/cb640008d741b15e0206d5a6b36ba7304b9c0a821c1e8bdd7165680a8e34/adb-homeassistant-1.3.1.tar.gz"

LICENSE="Apache"
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

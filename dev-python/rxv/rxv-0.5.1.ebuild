# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Automation Library for Yamaha RX-V473, RX-V573, RX-V673, RX-V773 receivers"
HOMEPAGE="https://github.com/wuub/rxv"
SRC_URI="https://files.pythonhosted.org/packages/2b/eb/5ee70a361d826c3e86eef2e61b8a5bd7d8346f34ee05e1e2121fc435dfbb/rxv-0.5.1.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 ~arm arm64 hppa ~ia64 ~mips ppc ppc64 s390 ~sparc x86 ~amd64-fbsd ~amd64-linux ~x86-linux"
IUSE="test"

DEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

python_test() {
	py.test -v || die "Tests failed under ${EPYTHON}"
}

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Automation Library for Yamaha RX-V473, RX-V573, RX-V673, RX-V773 receivers"
HOMEPAGE="https://github.com/wuub/rxv"
SRC_URI="https://files.pythonhosted.org/packages/67/01/f2c35d41cbef0e236122572da177d4684fa0a924e521538c194b020729dc/rxv-0.6.0.tar.gz"

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

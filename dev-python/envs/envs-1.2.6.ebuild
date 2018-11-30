# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Easy access of environment variables from Python with support for strings, booleans, list, tuples, and dicts."
HOMEPAGE="https://github.com/bjinwright/envs"
SRC_URI="https://files.pythonhosted.org/packages/34/f5/5277e967127581e5a63dca21dd42b43ab5d21ddd03cad0459649ee3c210a/envs-1.2.6.tar.gz"

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

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="A library to identify devices (phones, tablets) and their capabilities by parsing (browser/HTTP) user agent strings"
HOMEPAGE="https://github.com/selwin/python-user-agents"
SRC_URI="https://files.pythonhosted.org/packages/be/ff/886a1e2570784ee63b1c4b0fd77037b84087ffe7b7b45f9751285418be34/user-agents-1.1.0.tar.gz"

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

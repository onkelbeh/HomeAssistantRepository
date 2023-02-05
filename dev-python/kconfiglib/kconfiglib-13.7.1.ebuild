# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
PYTHON_REQ_USE="ncurses"
inherit distutils-r1

DESCRIPTION="A flexible Python Kconfig implementation"
HOMEPAGE="https://github.com/ulfalizer/Kconfiglib https://pypi.org/project/kconfiglib/"
SRC_URI="https://github.com/ulfalizer/Kconfiglib/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S=${WORKDIR}/${P^}
# pypi tarballs don't include tests
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

python_prepare_all() {
	distutils-r1_python_prepare_all

	# hacks to run tests
	mkdir Kconfiglib || die
	ln -s ../tests Kconfiglib || die
	# don't run kernel Kconfig compat tests
	sed -e 's/run_compatibility_tests()$/#\0/' -i testsuite.py || die
}

python_test() {
	"${EPYTHON}" testsuite.py || die "tests failed with ${EPYTHON}"
}

distutils_enable_tests pytest

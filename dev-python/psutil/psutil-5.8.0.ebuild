# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Retrieve information on running processes and system utilization"
HOMEPAGE="https://github.com/giampaolo/psutil https://pypi.org/project/psutil/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

PATCHES=(
	"${FILESDIR}/psutil-5.7.2-tests.patch"
)

DOCS="README.rst"

python_test() {
	if [[ ${EPYTHON} == pypy* ]]; then
		ewarn "Not running tests on ${EPYTHON} since they are broken"
		return 0
	fi

	# since we are running in an environment a bit similar to CI,
	# let's skip the tests that are disable for CI
	TRAVIS=1 APPVEYOR=1 "${EPYTHON}" psutil/tests/runner.py ||
		die "tests failed with ${EPYTHON}"
}

python_compile() {
	# force -j1 to avoid .o linking race conditions
	local MAKEOPTS=-j1
	distutils-r1_python_compile
}

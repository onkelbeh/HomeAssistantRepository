# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Retrieve information on running processes and system utilization"
HOMEPAGE="https://github.com/giampaolo/psutil https://pypi.org/project/psutil/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/ipaddress[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	"${FILESDIR}/psutil-5.6.7-tests.patch"
)

python_test() {
	if [[ ${EPYTHON} == pypy* ]]; then
		ewarn "Not running tests on ${EPYTHON} since they are broken"
		return 0
	fi

	# since we are running in an environment a bit similar to CI,
	# let's skip the tests that are disable for CI
	TRAVIS=1 APPVEYOR=1 "${EPYTHON}" psutil/tests/__main__.py ||
		die "tests failed with ${EPYTHON}"
}

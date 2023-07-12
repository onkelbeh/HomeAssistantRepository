# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1 pypi

TEST_PATCH=psutil-5.9.1-tests-r2.patch
DESCRIPTION="Retrieve information on running processes and system utilization"
HOMEPAGE="https://github.com/giampaolo/psutil https://pypi.org/project/psutil/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

PATCHES=(
	"${FILESDIR}/${TEST_PATCH}"
)

python_test() {
	# Since we are running in an environment a bit similar to CI,
	# let's skip the tests that are disabled for CI
	local -x TRAVIS=1
	local -x APPVEYOR=1
	local -x GITHUB_ACTIONS=1
	local -x GENTOO_TESTING=1
	"${EPYTHON}" psutil/tests/runner.py ||
		die "tests failed with ${EPYTHON}"
}

python_compile() {
	# Force -j1 to avoid .o linking race conditions
	local MAKEOPTS=-j1
	distutils-r1_python_compile
}

distutils_enable_tests pytest

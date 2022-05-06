# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="An implementation of the Debug Adapter Protocol for Python"
HOMEPAGE="https://github.com/microsoft/debugpy/ https://pypi.org/project/debugpy/"
SRC_URI="https://github.com/microsoft/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~m68k ppc ppc64 ~riscv ~s390 sparc x86"

# There is not enough time in the universe for this test suite
RESTRICT="test"

RDEPEND=""
BDEPEND="test? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest

python_prepare_all() {
	# Drop unnecessary and unrecognized option
	# __main__.py: error: unrecognized arguments: -n8
	# Do not timeout
	sed -e '/addopts/d' -e '/timeout/d' -i pytest.ini || die
	distutils-r1_python_prepare_all
}

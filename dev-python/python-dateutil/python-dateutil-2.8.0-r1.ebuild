# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Extensions to the standard Python datetime module"
HOMEPAGE="
	https://dateutil.readthedocs.org/
	https://pypi.org/project/python-dateutil
	https://github.com/dateutil/dateutil/
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 x86 amd64-linux x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/six-1.5[${PYTHON_USEDEP}]
	sys-libs/timezone-data
"
DEPEND="${RDEPEND}
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/freezegun[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

python_prepare_all() {
	local PATCHES=(
		"${FILESDIR}"/0001-zoneinfo-Get-timezone-data-from-system-tzdata.patch
	)

	# don't install zoneinfo tarball
	sed -i '/package_data=/d' setup.py || die

	distutils-r1_python_prepare_all
}

python_test() {
	py.test -v || die "Tests failed under ${EPYTHON}"
}

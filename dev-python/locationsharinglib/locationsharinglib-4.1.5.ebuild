# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="A library to retrieve coordinates from an google account that has been shared locations of other accounts."
HOMEPAGE="https://github.com/costastf/locationsharinglib https://pypi.org/project/locationsharinglib/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="dev-python/coloredlogs
	dev-python/requests
	dev-python/cachetools
	dev-python/pytz"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -i "s/coloredlogs~=10.0/coloredlogs/g" -i requirements.txt || die
	sed -i "s/requests~=2.25.1/requests/g" -i requirements.txt || die
	sed -i "s/cachetools~=2.1.0/cachetools/g" -i requirements.txt || die
	sed -i "s/pytz~=2020.5/pytz/g" -i requirements.txt || die
	eapply_user
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

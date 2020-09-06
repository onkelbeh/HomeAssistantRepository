# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="A library to retrieve coordinates from an google account that has been shared locations of other accounts."
HOMEPAGE="https://github.com/costastf/locationsharinglib https://pypi.org/project/locationsharinglib/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="dev-python/coloredlogs
	dev-python/requests
	dev-python/cachetools
	dev-python/pytz"
BDEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -i "s/coloredlogs~=10.0/coloredlogs/g" -i requirements.txt || die
	sed -i "s/requests~=2.21.0/requests/g" -i requirements.txt || die
	sed -i "s/cachetools~=2.0.1/cachetools/g" -i requirements.txt || die
	sed -i "s/pytz~=2019.2/pytz/g" -i requirements.txt || die
	eapply_user
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

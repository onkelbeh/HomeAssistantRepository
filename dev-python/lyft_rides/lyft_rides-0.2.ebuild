# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Unofficial Lyft Rides API Python SDK"
HOMEPAGE="https://github.com/gautammishra/lyft-rides-python-sdk https://pypi.org/project/lyft_rides/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS="README.rst"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -i "s/packages=find_packages()/packages=find_packages(exclude=['examples'])/g" -i setup.py || die
	eapply_user
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Rain Bird Controller"
HOMEPAGE="https://github.com/jbarrancos/pyrainbird/ https://pypi.org/project/pyrainbird/"

# Pypi SDIST incomplete, not tags at github
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
SRC_URI="https://github.com/onkelbeh/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="dev-python/pycryptodome[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"
BDEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed "s/packages=find_packages()/packages=find_packages(exclude=['test'])/g" -i setup.py || die
	eapply_user
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

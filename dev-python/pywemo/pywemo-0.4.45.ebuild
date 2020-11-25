# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Lightweight Python module to discover and control WeMo devices"
HOMEPAGE="https://github.com/pavoni/pywemo https://pypi.org/project/pywemo/"
# SRC is broken, packed with outrageous paths, no setup.py
# SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.macosx-10.15-x86_64.tar.gz -> ${P}.tar.gz"
# no tags or releases on github, use commit-id:
# SRC_URI="https://github.com/pavoni/pywemo/archive/d9cd5c246624ec7b81d63fcb6a02c983750f60f8.zip -> ${P}.zip"
# too complex and unstable, so I forked it and added the missing tags:
# fixed now https://github.com/pavoni/pywemo/issues/163#issuecomment-691500503
# SRC_URI="https://github.com/onkelbeh/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="https://github.com/pavoni/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/ifaddr-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

# packages=find_packages()
src_prepare() {
	sed -i "s/packages=find_packages()/packages=find_packages(exclude=['tests','tests.*'])/g" -i setup.py || die
	eapply_user
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

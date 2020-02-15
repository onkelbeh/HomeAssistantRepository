# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="A python module to the newest version number of Home Assistant."
HOMEPAGE="https://github.com/ludeeus/pyhaversion https://pypi.org/project/pyhaversion/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64 x86 amd64-linux x86-linux"
IUSE="test"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
		 dev-python/aresponses[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_prepare_all() {
	distutils-r1_python_prepare_all
	sed -e "s:find_packages():find_packages(exclude=['tests','tests.*']):" -i setup.py || die
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

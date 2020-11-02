# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="A Python wrapper around OpenWeatherMap web APIs"
HOMEPAGE="httpsx://github.com/csparpa/pyowm https://pypi.org/project/pyowm/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="dev-python/coverage[${PYTHON_USEDEP}]
		 dev-python/coveralls[${PYTHON_USEDEP}]
		 >=dev-python/pip-18.0[${PYTHON_USEDEP}]
		 dev-python/pytest[${PYTHON_USEDEP}]
		 dev-python/recommonmark[${PYTHON_USEDEP}]
		 dev-python/sphinx[${PYTHON_USEDEP}]
		 dev-python/tox[${PYTHON_USEDEP}]
		 dev-python/tox-travis[${PYTHON_USEDEP}]
		 dev-python/virtualenv[${PYTHON_USEDEP}]
		 dev-python/twine[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed "s/packages=find_packages()/packages=find_packages(exclude=['tests','tests.*'])/g" -i setup.py || die
	eapply_user
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

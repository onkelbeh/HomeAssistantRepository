# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

MY_PN=${PN//-/_}
DESCRIPTION="A package to access meteorological data from Environment Canada"
HOMEPAGE="https://github.com/michaeldavie/env_canada https://pypi.org/project/env-canada/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/geopy[${PYTHON_USEDEP}]
	dev-python/imageio[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S="${WORKDIR}/${MY_PN}-${PV}"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

src_prepare() {
	sed -i "s/packages=setuptools.find_packages()/packages=setuptools.find_packages(exclude=['tests','tests.*'])/g" -i setup.py || die
	eapply_user
}

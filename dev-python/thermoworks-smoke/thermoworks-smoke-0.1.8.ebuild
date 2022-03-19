# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

MY_P=${PN/-/_}-${PV}

DESCRIPTION="Pull data for your thermoworks smoke thermometer"
HOMEPAGE="https://github.com/nhorvath/python-thermoworks-smoke https://pypi.org/project/thermoworks-smoke/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_P}.tar.gz"
S=${WORKDIR}/${PN/-/_}-${PV}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/Pyrebase4-4.3.0[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

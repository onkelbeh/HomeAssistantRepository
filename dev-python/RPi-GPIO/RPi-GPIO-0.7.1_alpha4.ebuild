# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

MY_PN=${PN/-/.}
MY_PV=${PV/_alpha/a}

DESCRIPTION="A module to control Raspberry Pi GPIO channels"
HOMEPAGE="https://sourceforge.net/projects/raspberry-gpio-python/ https://pypi.org/project/RPi.GPIO/"
SRC_URI="mirror://pypi/${P:0:1}/${MY_PN}/${MY_PN}-${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.txt"

RDEPEND=""
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S=${WORKDIR}/${MY_PN}-${MY_PV}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

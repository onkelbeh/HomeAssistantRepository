# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{5,6,7}} )

inherit distutils-r1

DESCRIPTION="Websocket Client Library"
HOMEPAGE="https://github.com/wildfoundry/dataplicity-lomond https://pypi.org/project/lomond/"
SRC_URI="https://github.com/wildfoundry/dataplicity-lomond/archive/v${PV}.tar.gz -> ${P}.tar.gz"

MY_PN="lomond"
MY_P="${MY_PN}-${PV/_beta/b}"

LICENSE="BSD-4"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

S="${WORKDIR}/dataplicity-${MY_P}"

RDEPEND=""
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

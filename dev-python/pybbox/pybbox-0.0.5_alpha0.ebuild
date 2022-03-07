# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

MY_PV=${PV/_alpha0/-alpha}
DESCRIPTION="a simple python3 library for the Bouygues BBox Routeur API"
HOMEPAGE="https://github.com/HydrelioxGitHub/pybbox https://pypi.org/project/pybbox/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${PN}-${MY_PV}.zip -> ${P}.zip"
S="${WORKDIR}/${PN}-${MY_PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

#DOCS="README.md"

RDEPEND="dev-python/netaddr[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"
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

# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

MY_P=${PN/-/_}-${PV}

DESCRIPTION="Query a Quantum Gateway"
HOMEPAGE="https://github.com/cisasteelersfan/quantum_gateway https://pypi.org/project/quantum-gateway/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_P}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"
S=${WORKDIR}/${MY_P}

DOCS="README.md"

RDEPEND="dev-python/urllib3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20[${PYTHON_USEDEP}]
	>=dev-python/esprima-4.0[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

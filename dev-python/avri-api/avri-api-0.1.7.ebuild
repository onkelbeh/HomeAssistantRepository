# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7..8} )

inherit distutils-r1

DESCRIPTION="Unofficial wrapper around Avri endpoints"
HOMEPAGE="https://github.com/timvancann/pyavri https://pypi.org/project/avri-api/"

# no SDIST, no releases on github, see
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
MY_PN="pyavri"
SRC_URI="https://github.com/onkelbeh/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${MY_PN}-${PV}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="~dev-python/requests-2.22.0[${PYTHON_USEDEP}]
	~dev-python/pyfunctional-1.3.0[${PYTHON_USEDEP}]"
BDEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

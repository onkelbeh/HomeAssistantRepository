# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="A python3 library to communicate with Adax"
HOMEPAGE="https://github.com/Danielhiversen/pyAdaxLocal https://pypi.org/project/Adax-local/"

# Pypi SDSIT can't be compiled:
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
# so I use the Source from Github for now:
MY_PN="pyAdaxLocal"
SRC_URI="https://github.com/Danielhiversen/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS=""

RDEPEND=">=dev-python/aiohttp-3.0.6[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-1.4.0[${PYTHON_USEDEP}]
	dev-python/bleak[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

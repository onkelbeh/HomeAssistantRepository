# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="DTLSSocket is a cython wrapper for tinydtls with a Socket like interface"
HOMEPAGE="https://git.fslab.de/jkonra2m/tinydtls-cython https://pypi.org/project/DTLSSocket/"
MY_PN="DTLSSocket"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS="README"

RDEPEND="dev-python/cython[${PYTHON_USEDEP}]"
BDEPEND="${REDEPEND}
	>=dev-python/setuptools-18.0[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

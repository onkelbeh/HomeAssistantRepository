# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7,8} )

inherit distutils-r1

DESCRIPTION="Asynchronous Python client for Internet Printing Protocol (IPP)."
HOMEPAGE="https://github.com/ctalkington/python-ipp https://pypi.org/project/pyipp/"

# SDIST on Pypi is incomplete, requirements.txt is missing
# SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
MY_PN="python-ipp"
SRC_URI="https://github.com/ctalkington/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="~dev-python/aiohttp-3.6.2[${PYTHON_USEDEP}]
	~dev-python/deepmerge-0.1.0[${PYTHON_USEDEP}]
	~dev-python/yarl-1.4.2[${PYTHON_USEDEP}]"
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

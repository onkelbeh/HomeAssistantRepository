# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="A Python library for controlling YeeLight RGB bulbs."
HOMEPAGE="https://gitlab.com/stavros/python-yeelight https://pypi.org/project/yeelight/"

# No SDIST on Pypi
# SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
SRC_URI="https://gitlab.com/stavros/python-yeelight/-/archive/ad3e4e7552531b270224a33f1d9dc9f5887e3280/python-yeelight-ad3e4e7552531b270224a33f1d9dc9f5887e3280.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/"python-yeelight-ad3e4e7552531b270224a33f1d9dc9f5887e3280"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS="README.rst"

RDEPEND="dev-python/future[${PYTHON_USEDEP}]
	dev-python/ifaddr[${PYTHON_USEDEP}]"
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

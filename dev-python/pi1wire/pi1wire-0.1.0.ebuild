# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="1Wire Sensor Library for Raspberry PI"
HOMEPAGE="https://github.com/ushiboy/pi1wire https://pypi.org/project/pi1wire/"

# No SDIST in Pypi
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
SRC_URI="https://github.com/ushiboy/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm ~arm64"
IUSE="test"

DOCS="README.md"

RDEPEND=""
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

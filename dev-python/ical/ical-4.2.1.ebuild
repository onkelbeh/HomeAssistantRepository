# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Python iCalendar implementation (rfc 2445)"
HOMEPAGE="https://github.com/allenporter/ical https://pypi.org/project/ical/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	>=dev-python/tzdata-2022.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.1[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-3.0.9[${PYTHON_USEDEP}]
	>=dev-python/emoji-2.2.0[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

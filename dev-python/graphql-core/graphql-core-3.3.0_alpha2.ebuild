# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="GraphQL implementation for Python, a port of GraphQL.js, the JavaScript reference implementation for GraphQL."
HOMEPAGE="https://github.com/graphql-python/graphql-core https://pypi.org/project/graphql-core/"
MY_P="${PN}-${PV/_alpha/a}"
MY_P="${MY_P/-/_}"
SRC_URI="https://files.pythonhosted.org/packages/source/${P:0:1}/${PN}/${MY_P}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

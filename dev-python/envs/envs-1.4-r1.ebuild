# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1
DISTUTILS_USE_SETUPTOOLS=pyproject.toml

DESCRIPTION="Easy access of environment variables from Python with support for strings, booleans, list, tuples, and dicts."
HOMEPAGE="https://github.com/bjinwright/envs https://pypi.org/project/envs/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86 ~amd64-linux ~x86-linux"
IUSE="cli test"
RESTRICT="!test? ( test )"

# missing DOCS="README.md"

RDEPEND="cli? (
			  >=dev-python/jinja-3.0.3[${PYTHON_USEDEP}]
			  >=dev-python/click-8.0.3[${PYTHON_USEDEP}]
			  >=dev-python/terminaltables-3.1.10[${PYTHON_USEDEP}]
			  )"
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

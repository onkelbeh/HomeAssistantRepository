# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Persistent cache for requests library"
HOMEPAGE="https://github.com/reclosedev/requests-cache https://pypi.org/project/requests-cache/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test doc"

RDEPEND=">=dev-python/requests-1.1.0[${PYTHON_USEDEP}]"
BDEPEND="${REDEPEND}
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_compile_all() {
	use doc && emake -C docs html
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	distutils-r1_python_install_all
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

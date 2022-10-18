# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Multi-producer-multi-consumer signal dispatching mechanism"
HOMEPAGE="https://pydispatcher.sourceforge.net https://pypi.org/project/PyDispatcher/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test doc"
RESTRICT="!test? ( test )"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_compile_all() {
	if use doc; then
		cd docs/pydoc || die
		"${EPYTHON}" builddocs.py || die
	fi
}

python_test() {
	py.test -v -v || die
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/pydoc/. )
	distutils-r1_python_install_all
}

distutils_enable_tests pytest

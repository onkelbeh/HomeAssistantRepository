# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="An Abode alarm Python library running on Python 3."
HOMEPAGE="https://github.com/MisterWil/abodepy https://pypi.org/project/abodepy/"
SRC_URI="https://github.com/MisterWil/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc test"

RDEPEND="~dev-python/lomond-0.3.3[${PYTHON_USEDEP}]
		 >=dev-python/requests-2.12.4[${PYTHON_USEDEP}]
		 >=dev-python/colorlog-3.0.1[${PYTHON_USEDEP}]"
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

DOCS=( CHANGES.rst  LICENSE  README.rst )

python_prepare_all() {
			 distutils-r1_python_prepare_all
}

python_compile_all() {
			 use doc && emake -C docs html
}

python_test() {
		  esetup.py test
}

python_install_all() {
			 use doc && local HTML_DOCS=( docs/_build/html/. )
			 distutils-r1_python_install_all
}

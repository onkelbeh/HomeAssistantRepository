# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="An Abode alarm Python library running on Python 3."
HOMEPAGE="https://github.com/MisterWil/abodepy https://pypi.org/project/abodepy/"
SRC_URI="https://github.com/MisterWil/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="doc test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/lomond-0.3.3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.12.4[${PYTHON_USEDEP}]
	>=dev-python/colorlog-3.0.1[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

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

distutils_enable_tests pytest

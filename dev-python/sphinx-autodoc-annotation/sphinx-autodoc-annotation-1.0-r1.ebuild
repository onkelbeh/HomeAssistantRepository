# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

MY_PVR=${PVR/-r/-}
DESCRIPTION="Use Python 3 annotations in sphinx-enabled docstrings"
HOMEPAGE="https://github.com/hsoft/sphinx-autodoc-annotation https://pypi.org/project/sphinx-autodoc-annotation/"

# https://files.pythonhosted.org/packages/c9/2b/81f620d831cd0632ba7583723ab42e840ba766b86868307ee0877c40a2e2/sphinx-autodoc-annotation-1.0-1.tar.gz
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${PN}-${MY_PVR}.tar.gz -> ${PF}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

# sphinx-autodoc-annotation-1.0-1
S="${WORKDIR}/${PN}-${MY_PVR}"

RDEPEND=""
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

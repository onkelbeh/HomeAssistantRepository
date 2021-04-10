# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7..9} )
PYTHON_REQ_USE="xml(+)"

inherit distutils-r1

DESCRIPTION="XML bomb protection for Python stdlib modules, an xml serialiser"
HOMEPAGE="https://bitbucket.org/tiran/defusedxml https://pypi.org/project/defusedxml/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="examples"

LICENSE="PSF-2"
SLOT="0"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	esetup.py test
}

python_install_all() {
	use examples && local EXAMPLES=( other/. )
	distutils-r1_python_install_all
}

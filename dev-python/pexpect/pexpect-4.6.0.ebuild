# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1

DESCRIPTION="Python module for spawning child apps and responding to expected patterns"
HOMEPAGE="https://pexpect.readthedocs.io/ https://pypi.org/project/pexpect/ https://github.com/pexpect/pexpect/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86 ~amd64-linux ~x86-linux"
IUSE="doc examples"

RDEPEND=">=dev-python/ptyprocess-0.5[${PYTHON_USEDEP}]"
DEPEND="
	doc? ( dev-python/sphinx )"

distutils_enable_tests pytest

python_compile_all() {
	use doc && emake -C doc html
}

python_install_all() {
	use doc && local HTML_DOCS=( doc/_build/html/. )
	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
	distutils-r1_python_install_all
}

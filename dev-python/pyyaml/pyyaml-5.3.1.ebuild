# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

MY_P="PyYAML-${PV}"

DESCRIPTION="YAML parser and emitter for Python"
HOMEPAGE="https://pyyaml.org/wiki/PyYAML https://pypi.org/project/PyYAML/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="examples libyaml"

RDEPEND="libyaml? ( dev-libs/libyaml )"
DEPEND="${RDEPEND}
	libyaml? ( $(python_gen_cond_dep 'dev-python/cython[${PYTHON_USEDEP}]' python2_7 'python3*') )"

S="${WORKDIR}/${MY_P}"

PATCHES=(
	# bug #659348
	"${FILESDIR}/${P}-cve-2017-18342.patch"
)

python_configure_all() {
	mydistutilsargs=( $(use_with libyaml) )
}

python_test() {
	esetup.py test
}

python_install_all() {
	distutils-r1_python_install_all
	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}
	fi
}

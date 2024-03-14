# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1 pypi

DESCRIPTION="Draws Python object reference graphs with graphviz"
HOMEPAGE="
	https://github.com/mgedmin/objgraph/
	https://pypi.org/project/objgraph/
"

LICENSE="MIT"
KEYWORDS="amd64 arm arm64 x86"
SLOT="0"
IUSE="doc"

RDEPEND="
	media-gfx/graphviz
"
BDEPEND="
	test? (
		media-gfx/xdot
	)
"

PATCHES=(
	"${FILESDIR}/objgraph-3.4.1-tests.patch"
)

distutils_enable_tests unittest

src_prepare() {
	# the dependency is optional, actually
	sed -i -e '/graphviz/d' setup.py || die
	distutils-r1_src_prepare
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/* )
	distutils-r1_python_install_all
}

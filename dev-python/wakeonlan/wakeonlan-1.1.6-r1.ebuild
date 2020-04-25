# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="A small python module for wake on lan."
HOMEPAGE="https://github.com/remcohaszing/pywakeonlan"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64 x86 amd64-linux x86-linux"
IUSE="test"

DEPEND="
	>=dev-python/setuptools_scm-1.15.7[${PYTHON_USEDEP}]
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
	)
"
RDEPEND=""

# Many tests fail, even on a regular tox run on a upstream clone
RESTRICT="test"

PATCHES=( "${FILESDIR}"/${P}-setuptools-scm.patch )

python_test() {
	${PYTHON} psutil/tests/__main__.py || die
}

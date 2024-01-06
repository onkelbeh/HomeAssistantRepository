# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

MY_P=${P/-/_}
DESCRIPTION="Backported and Experimental Type Hints for Python 3.7+"
HOMEPAGE="https://pypi.org/project/typing-extensions/ https://github.com/python/typing_extensions/"
SRC_URI="https://github.com/python/typing_extensions/archive/${PV}.tar.gz -> ${MY_P}.gh.tar.gz"
S=${WORKDIR}/${MY_P}

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

DOCS="README.md"

python_test() {
	cd "${S}"/src || die
	"${EPYTHON}" test_typing_extensions.py -v || die "tests failed under ${EPYTHON}"
}

distutils_enable_tests pytest

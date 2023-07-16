# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python bindings for the CUPS API"
HOMEPAGE="http://cyberelk.net/tim/data/pycups/"
SRC_URI="$(pypi_sdist_url "${PN}" "${PV}" ".tar.bz2")"

LICENSE="GPL-2"
KEYWORDS="amd64 arm arm64 x86"
SLOT="0"
IUSE="doc examples"

RDEPEND="net-print/cups"
DEPEND="${RDEPEND}"

# epydoc kinda sucks and supports python2 only (it's dead too),
# and since we're dealing with a binary module we need exact version
# match. therefore, docbuilding *requires* any python2 being enabled.

python_compile() {
	python_is_python3 || local -x CFLAGS="${CFLAGS} -fno-strict-aliasing"
	distutils-r1_python_compile
}

python_compile_all() {
	if use doc; then
		# we can't use Makefile since it relies on hardcoded paths
		epydoc -o html --html cups || die "doc build failed"
		HTML_DOCS=( html/. )
	fi
}

python_install_all() {
	if use examples; then
		dodoc -r examples
		docompress -x "/usr/share/doc/${PF}/examples"
	fi
	distutils-r1_python_install_all
}

distutils_enable_tests pytest

# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
# pypy isn't supported upstream because of its UTF8 representation for strings
# See https://github.com/mrabarnett/mrab-regex/issues/521#issuecomment-1936260187.
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Alternative regular expression module to replace re"
HOMEPAGE="
	https://github.com/mrabarnett/mrab-regex/
	https://pypi.org/project/regex/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="doc"

PATCHES=(
	"${FILESDIR}/${PN}-2021.4.4-pypy3-fix-test_empty_array.patch"
	"${FILESDIR}/${PN}-2021.4.4-pypy3-fix-test_issue_18468.patch"
)

distutils_enable_tests unittest

python_test() {
	eunittest -s "${BUILD_DIR}"/lib
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/Features.html )
	local DOCS=( README.rst docs/*.rst )

	distutils-r1_python_install_all
}

distutils_enable_tests pytest

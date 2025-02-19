# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Type system extensions for programs checked with mypy"
HOMEPAGE="
	https://www.mypy-lang.org/
	https://github.com/python/mypy_extensions/
"
SRC_URI="
	https://github.com/python/mypy_extensions/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

distutils_enable_tests pytest

python_test() {
	epytest tests/*.py
}

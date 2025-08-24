# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3_11 python3_{11..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="ReactiveX (Rx) for Python"
HOMEPAGE="http://reactivex.io https://github.com/ReactiveX/RxPY https://pypi.org/project/reactivex/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/typing-extensions-4.1.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3_11 python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="DIDL-Lite (Digital Item Declaration Language) tools for Python"
HOMEPAGE="https://github.com/StevenLooman/python-didl-lite/ https://pypi.org/project/python-didl-lite/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/defusedxml-0.6.0"

distutils_enable_tests pytest

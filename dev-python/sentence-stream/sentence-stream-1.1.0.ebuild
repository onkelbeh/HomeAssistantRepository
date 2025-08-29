# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3_11 python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A small sentence splitter for text streams"
HOMEPAGE="https://pypi.org/project/sentence-stream/ https://github.com/OHF-Voice/sentence-stream"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="~dev-python/regex-2024.11.6[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

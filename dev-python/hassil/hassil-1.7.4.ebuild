# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3_11 python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="The Home Assistant Intent Language parser"
HOMEPAGE="http://github.com/home-assistant/hassil https://pypi.org/project/hassil/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	~dev-python/unicode-rbnf-1.1.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Composable command line interface toolkit, async version"
HOMEPAGE="https://github.com/python-trio/asyncclick/ https://palletsprojects.com/p/click/ https://pypi.org/project/asyncclick/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="dev-python/anyio[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

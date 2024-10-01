# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Often used functions in vladimirs-git projects"
HOMEPAGE="https://github.com/vladimirs-git/vhelpers https://pypi.org/project/vhelpers/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/tomli-2.0.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

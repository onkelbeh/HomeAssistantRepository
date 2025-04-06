# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python API for Numato GPIO Expanders"
HOMEPAGE="https://github.com/clssn/numato-gpio https://pypi.org/project/numato-gpio/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/pyserial-3.1.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

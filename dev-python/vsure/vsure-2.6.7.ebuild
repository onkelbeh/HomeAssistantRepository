# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Read and change status of verisure devices through mypages."
HOMEPAGE="https://github.com/persandstrom/python-verisure https://pypi.org/project/vsure/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/requests-2.25.1[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

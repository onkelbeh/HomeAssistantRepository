# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Discover, connect and control Gree based minisplit systems"
HOMEPAGE="https://github.com/cmroche/greeclimate https://pypi.org/project/greeclimate/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/netifaces[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.10.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

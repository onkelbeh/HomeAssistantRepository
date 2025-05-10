# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python API for Salda Smarty Modbus TCP"
HOMEPAGE="https://github.com/martinssipenko/pysmarty2 https://pypi.org/project/pysmarty2/"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/pymodbus-3.6.9[${PYTHON_USEDEP}]"

src_prepare() {
	echo "pymodbus>=3.6.9" > requirements.txt
	eapply_user
	}

distutils_enable_tests pytest

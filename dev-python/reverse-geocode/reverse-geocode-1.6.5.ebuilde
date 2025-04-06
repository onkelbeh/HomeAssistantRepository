# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="Reverse geocode the given latitude / longitude"
HOMEPAGE="
	https://pypi.org/project/reverse-geocode/
"
PATCHES="${FILESDIR}/${PN}-build-system.patch"
LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.12.0[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest

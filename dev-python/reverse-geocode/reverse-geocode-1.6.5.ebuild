# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Reverse geocode the given latitude / longitude"
HOMEPAGE="https://pypi.org/project/reverse-geocode/ https://github.com/richardpenman/reverse_geocode/"
PATCHES="${FILESDIR}/${PN}-build-system.patch"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.12.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

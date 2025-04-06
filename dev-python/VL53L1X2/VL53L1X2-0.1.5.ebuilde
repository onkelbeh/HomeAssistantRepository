# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
DESCRIPTION="vl53l1x distance sensor driver for Raspberry Pi"
HOMEPAGE="https://github.com/josemotta/vl53l1x-python https://pypi.org/project/VL53L1X2/"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test ) mirror"

DOCS="README.md"

RDEPEND="dev-python/smbus2[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

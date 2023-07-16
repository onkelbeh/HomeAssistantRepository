# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Library to read data from BeeWi SmartClim sensor using Bluetooth LE"
HOMEPAGE="https://github.com/alemuro/beewi_smartclim https://pypi.org/project/beewi-smartclim/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/btlewrap-0.0.8[${PYTHON_USEDEP}]
	dev-python/bluepy[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

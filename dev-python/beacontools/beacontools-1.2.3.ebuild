# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="A Python library for working with various types of Bluetooth LE Beacons."
HOMEPAGE="https://github.com/citruz/beacontools https://pypi.org/project/beacontools/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/construct-2.9.52[${PYTHON_USEDEP}]
	<dev-python/construct-2.11[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

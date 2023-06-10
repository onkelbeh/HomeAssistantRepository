# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Allows for querying of the RSSI values for nearby devices using pybluez. Ported to Python 3, based on https://github.com/ewenchou/bluetooth-proximity"
HOMEPAGE="https://github.com/FrederikBolding/bluetooth-proximity https://pypi.org/project/bt-proximity/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

distutils_enable_tests pytest

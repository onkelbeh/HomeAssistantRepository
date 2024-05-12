# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="a library to communicate with the RFXtrx family of devices"
HOMEPAGE="https://github.com/Danielhiversen/pyRFXtrx https://pypi.org/project/pyRFXtrx/"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/pyserial-2.7[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

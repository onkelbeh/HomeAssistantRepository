# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="growattServer"
inherit distutils-r1 pypi

DESCRIPTION="A package to talk to growatt server"
HOMEPAGE="https://github.com/indykoning/PyPi_GrowattServer https://pypi.org/project/growattServer/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"

DOCS="README.md"

distutils_enable_tests pytest

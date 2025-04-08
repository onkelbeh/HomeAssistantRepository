# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Python wrapper for the Pterodactyl Panel API"
HOMEPAGE="
	https://pypi.org/project/py-dactyl/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest

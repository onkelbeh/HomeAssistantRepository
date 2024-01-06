# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
DESCRIPTION="get live-data from mvg-live.de"
HOMEPAGE="https://github.com/pc-coholic/PyMVGLive https://pypi.org/project/PyMVGLive/"

LICENSE="all-rights-reserved"

SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test ) mirror"

DOCS="README.md"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

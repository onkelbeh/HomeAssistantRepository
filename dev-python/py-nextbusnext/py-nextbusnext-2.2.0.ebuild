# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Client for the NextBus public API for real-time transit arrival data"
HOMEPAGE="https://github.com/vividboarder/py_nextbus https://pypi.org/project/py-nextbusnext/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
DOCS="README.md"

RDEPENDS="
	dev-python/requests[${PYTHON_USEDEP}]
"

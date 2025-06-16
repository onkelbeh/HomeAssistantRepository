# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Niko Home Control library for python"
HOMEPAGE="https://pypi.org/project/nhc/ https://github.com/vandeurenglenn/nhc"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-python/nclib[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

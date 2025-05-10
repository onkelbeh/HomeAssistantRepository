# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="A module for grabbing the color palette from an image."
HOMEPAGE="https://github.com/fengsp/color-thief-py https://pypi.org/project/colorthief/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/pillow[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

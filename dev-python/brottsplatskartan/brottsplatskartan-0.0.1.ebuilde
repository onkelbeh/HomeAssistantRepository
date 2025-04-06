# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Simple API wrapper to brottsplatskartan.se."
HOMEPAGE="https://github.com/chrillux/brottsplatskartan https://pypi.org/project/brottsplatskartan/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/requests-2.20.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

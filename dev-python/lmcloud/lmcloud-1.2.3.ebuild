# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python implementation of the new La Marzocco API"
HOMEPAGE="https://github.com/zweckj/lmcloud https://pypi.org/project/lmcloud/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/httpx-0.16.1[${PYTHON_USEDEP}]
	>=dev-python/Authlib-0.15.5[${PYTHON_USEDEP}]
	>=dev-python/websockets-11.0.2[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.20.2[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous API Library to work with Elmax devices"
HOMEPAGE="https://github.com/albertogeniola/elmax-api https://pypi.org/project/elmax-api/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"
PATCHES="${FILESDIR}/${PN}-fix-build.patch"
DOCS="README.md"

RDEPEND=">=dev-python/pyjwt-1.7.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.18.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.3[${PYTHON_USEDEP}]
	>=dev-python/websockets-13.0.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

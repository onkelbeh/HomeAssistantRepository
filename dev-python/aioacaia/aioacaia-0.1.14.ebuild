# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="An async implementation of PyAcaia"
HOMEPAGE="https://pypi.org/project/aioacaia/ https://github.com/zweckj/aioacaia"
PATCHES="${FILESDIR}/${PN}-build-system.patch"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/bleak-0.20.2[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_13 )
inherit cargo distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
	https://pypi.org/project/jiter/
"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
SRC_URI="
	$(pypi_sdist_url "${PN^}" "${PV}") -> ${P}.tar.gz
	https://github.com/xavierforestier/jiter/releases/download/v${PV}/jiter-${PV}-crates.tar.xz
"

RDEPEND=""
BDEPEND=""

distutils_enable_tests pytest

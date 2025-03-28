# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )
inherit distutils-r1 pypi

SRC_URI="https://github.com/shmuelzon/${PN}/archive/refs/tags/${PV}.tar.gz"

DESCRIPTION="A module to interact with Ituran's web service."
HOMEPAGE="
	https://pypi.org/project/pyituran/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_compile() {
	VERSION=${PV} distutils-r1_src_compile
}

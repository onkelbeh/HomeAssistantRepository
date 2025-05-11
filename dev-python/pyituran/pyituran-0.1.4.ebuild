# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )
inherit distutils-r1 pypi

DESCRIPTION="A module to interact with Ituran's web service."
HOMEPAGE="https://pypi.org/project/pyituran/ https://github.com/shmuelzon/pyituran"
SRC_URI="https://github.com/shmuelzon/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_compile() {
	VERSION=${PV} distutils-r1_src_compile
}

# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1

DESCRIPTION="Control your Sisyphus kinetic art tables (sisyphus-industries.com)"
HOMEPAGE="https://github.com/jkeljo/sisyphus-control https://pypi.org/project/sisyphus-control/"
SRC_URI="https://github.com/jkeljo/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

# https://github.com/jkeljo/sisyphus-control/issues/6 pinning to old version
RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/netifaces[${PYTHON_USEDEP}]
	>=dev-python/python-socketio-4.6.1[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-3.14.2[${PYTHON_USEDEP}]"

src_prepare() {
	echo -ne '\n[build-system]\nrequires = ["poetry>=0.12"]\nbuild-backend = "poetry.masonry.api"\n' >> pyproject.toml  || die
	eapply_user
}

distutils_enable_tests pytest

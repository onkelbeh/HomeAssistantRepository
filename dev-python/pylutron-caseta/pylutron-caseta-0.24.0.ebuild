# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Provides an API to the Lutron Smartbridge"
HOMEPAGE="https://github.com/gurumitts/pylutron-caseta https://pypi.org/project/pylutron-caseta/"
SRC_URI="https://github.com/gurumitts/pylutron-caseta/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="cli test"
RESTRICT="!test? ( test )"

DOCS="CHANGELOG.md README.md"

RDEPEND="
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
"
BDEPEND="
	cli? (
		>=dev-python/click-8.1.2[${PYTHON_USEDEP}]
		>=dev-python/zeroconf-0.38.4[${PYTHON_USEDEP}]
		dev-python/pyxdg[${PYTHON_USEDEP}]
	)
	test? (
		dev-python/coveralls[${PYTHON_USEDEP}]
		~dev-python/pytest-asyncio-0.14.0[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-sugar[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

python_install() {
		distutils-r1_python_install
		if ! use cli; then
				rm "${ED}/usr/lib/python-exec/${EPYTHON}/"{lap-pair,leap,leap-scan} || die
				rm "${ED}"/usr/bin/{lap-pair,leap,leap-scan} || die
		fi
}

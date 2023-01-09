# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Python Matter WebSocket Server"
HOMEPAGE="https://github.com/home-assistant-libs/python-matter-server https://pypi.org/project/python-matter-server/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/aiorun[${PYTHON_USEDEP}]
	dev-python/coloredlogs[${PYTHON_USEDEP}]
	dev-python/dacite[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
	=dev-python/home-assistant-chip-clusters-2022.12.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

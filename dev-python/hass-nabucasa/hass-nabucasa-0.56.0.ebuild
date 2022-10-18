# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Home Assistant cloud integration by Nabu Casa, Inc."
HOMEPAGE="https://www.nabucasa.com/ https://github.com/NabuCasa/hass-nabucasa/ https://pypi.org/project/hass-nabucasa/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="~dev-python/pycognito-2022.8.0[${PYTHON_USEDEP}]
	~dev-python/snitun-0.31.0[${PYTHON_USEDEP}]
	>=app-crypt/acme-1.30.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.8[${PYTHON_USEDEP}]
	>=dev-python/attrs-19.3.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}]
	~dev-python/atomicwrites-homeassistant-1.4.1[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

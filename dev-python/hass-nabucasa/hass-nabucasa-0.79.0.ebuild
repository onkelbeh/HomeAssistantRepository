# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Home Assistant cloud integration by Nabu Casa, Inc."
HOMEPAGE="https://www.nabucasa.com/ https://github.com/NabuCasa/hass-nabucasa/ https://pypi.org/project/hass-nabucasa/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=app-crypt/acme-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}]
	~dev-python/atomicwrites-homeassistant-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/attrs-19.3.0[${PYTHON_USEDEP}]
	>=dev-python/ciso8601-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-42.0.0[${PYTHON_USEDEP}]
	~dev-python/pycognito-2024.2.0[${PYTHON_USEDEP}]
	~dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}]
	~dev-python/snitun-0.36.2[${PYTHON_USEDEP}]"

BDEPEND="
	test? (
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

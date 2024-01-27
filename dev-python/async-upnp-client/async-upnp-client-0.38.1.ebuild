# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Async UPnP Client"
HOMEPAGE="https://github.com/StevenLooman/async_upnp_client https://pypi.org/project/async-upnp-client/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/voluptuous-0.12.1[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.9.1[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/async-timeout-3[${PYTHON_USEDEP}]' python3_10)
	$(python_gen_cond_dep '<dev-python/async-timeout-5[${PYTHON_USEDEP}]' python3_10)
	>=dev-python/python-didl-lite-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.6.0[${PYTHON_USEDEP}]"

BDEPEND="
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/asyncmock[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

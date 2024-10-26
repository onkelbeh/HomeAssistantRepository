# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Python library to access the Solar-Log JSON interface"
HOMEPAGE="https://github.com/dontinelli/solarlog_cli https://pypi.org/project/solarlog_cli/"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
	~dev-python/aioresponses-0.7.6[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13[${PYTHON_USEDEP}]
	~dev-python/pytest-aio-1.9.0[${PYTHON_USEDEP}]
	~dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
	~dev-python/syrupy-4.6.1[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest

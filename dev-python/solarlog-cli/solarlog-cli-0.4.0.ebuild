# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Python library to access the Solar-Log"
HOMEPAGE="https://github.com/dontinelli/solarlog_cli https://pypi.org/project/solarlog-cli/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
	~dev-python/aioresponses-0.7.6[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13[${PYTHON_USEDEP}]
	~dev-python/pytest-aio-1.9.0[${PYTHON_USEDEP}]
	~dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
	~dev-python/syrupy-4.6.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1
DESCRIPTION="Get data from the Azure DevOps API."
HOMEPAGE="https://github.com/timmo001/aioazuredevops https://pypi.org/project/aioazuredevops/"
SRC_URI="https://github.com/timmo001/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/incremental-22.10.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		  dev-python/aioresponses[${PYTHON_USEDEP}]
		  dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		  dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		  dev-python/syrupy[${PYTHON_USEDEP}]
		  )"

distutils_enable_tests pytest

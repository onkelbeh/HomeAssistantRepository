# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="A Server-Sent Event python client base on aiohttp"
HOMEPAGE="https://github.com/JelleZijlstra/aiohttp-sse-client2 https://pypi.org/project/aiohttp-sse-client2/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
	dev-python/multidict[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/pytest-runner[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

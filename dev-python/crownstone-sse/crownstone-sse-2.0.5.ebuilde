# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python library that listens to Crownstone SSE events."
HOMEPAGE="https://github.com/crownstone/crownstone-lib-python-sse https://pypi.org/project/crownstone-sse/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		>=dev-python/asynctest-0.13.0[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

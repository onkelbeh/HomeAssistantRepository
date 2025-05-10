# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A package to communicate with Wolf SmartSet Cloud"
HOMEPAGE="https://github.com/janrothkegel/wolf-comm https://pypi.org/project/wolf-comm/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.26.0[${PYTHON_USEDEP}]
	>=dev-python/lxml-5.1.0[${PYTHON_USEDEP}]
	>=dev-python/pkce-1.0.3[${PYTHON_USEDEP}]
	>=dev-python/shortuuid-1.0.11[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

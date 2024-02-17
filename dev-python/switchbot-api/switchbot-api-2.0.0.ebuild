# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="An asynchronous library to use Switchbot API"
HOMEPAGE="https://github.com/SeraphicCorp/py-switchbot-api https://pypi.org/project/switchbot-api/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"
DOCS="README.md"
RDEPEND=">=dev-python/aiohttp-3.8.4[${PYTHON_USEDEP}]"
distutils_enable_tests pytest

# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client for the HomeWizard Energy"
HOMEPAGE="https://github.com/dcsbl/python-homewizard-energy https://pypi.org/project/python-homewizard-energy/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"
BDEPEND="
    test? (
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
        dev-python/aresponses[${PYTHON_USEDEP}]
    )"

distutils_enable_tests pytest

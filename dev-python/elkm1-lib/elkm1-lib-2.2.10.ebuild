# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Library for interacting with ElkM1 alarm/automation panel."
HOMEPAGE="https://github.com/gwww/elkm1 https://pypi.org/project/elkm1-lib/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/pyserial-asyncio-fast-0.11[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-ruff[${PYTHON_USEDEP}]
		dev-python/pytest-urwid[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

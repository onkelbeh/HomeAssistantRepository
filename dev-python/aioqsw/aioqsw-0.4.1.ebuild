# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Library to control QNAP QSW devices"
HOMEPAGE="https://github.com/Noltari/aioqsw https://pypi.org/project/aioqsw/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"

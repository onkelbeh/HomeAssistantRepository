# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="MPython module to talk to Husqvarna Automower."
HOMEPAGE="https://github.com/Thomas55555/aioautomower https://pypi.org/project/aioautomower/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/mashumaro[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

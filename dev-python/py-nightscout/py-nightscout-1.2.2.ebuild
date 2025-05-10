# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A library that provides a Python async interface to Nightscout"
HOMEPAGE="https://github.com/marciogranzotto/py-nightscout https://pypi.org/project/py-nightscout/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

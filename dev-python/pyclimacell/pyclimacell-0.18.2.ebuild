# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Async Python3.7+ package to access the ClimaCell API"
HOMEPAGE="https://github.com/raman325/pyclimacell https://pypi.org/project/pyclimacell/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/aiohttp-3.6.2[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Nieoficjalne API do dzienniczka elektronicznego UONET+"
HOMEPAGE="https://github.com/kapi2289/vulcan-api https://pypi.org/project/vulcan-api/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/pyopenssl[${PYTHON_USEDEP}]
	dev-python/uonet-request-signer-hebe[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/aenum[${PYTHON_USEDEP}]
	dev-python/related[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/faust-cchardet[${PYTHON_USEDEP}]
	dev-python/aiodns[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python API to interact with Ruckus Unleashed and ZoneDirector devices."
HOMEPAGE="https://github.com/ms264556/aioruckus https://pypi.org/project/aioruckus/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.8.4[${PYTHON_USEDEP}]
	>=dev-python/cryptography-41.0.0[${PYTHON_USEDEP}]
	>=dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

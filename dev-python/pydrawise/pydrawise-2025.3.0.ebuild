# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python API for interacting with Hydrawise sprinkler controllers."
HOMEPAGE="https://github.com/dknowles2/pydrawise https://pypi.org/project/pydrawise/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/aiohttp-3.11.13[${PYTHON_USEDEP}]
	>=dev-python/apischema-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/gql-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/graphql-core-3.2.6[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

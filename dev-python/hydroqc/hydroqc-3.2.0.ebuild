# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A wrapper library written in python to access Hydro-Quebec API."
HOMEPAGE="https://hydroqc.ca/en/ https://gitlab.com/hydroqc/hydroqc https://pypi.org/project/Hydro-Quebec-API-Wrapper/"
SRC_URI="$(pypi_sdist_url Hydro-Quebec-API-Wrapper ${PV}) -> ${P}.tar.gz"
S="${WORKDIR}/hydro_quebec_api_wrapper-${PV}"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
#IUSE="test"
#RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
	dev-python/pkce[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/aiocache[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
"

#BDEPEND="
#	test? (
#		dev-python/parametrized[${PYTHON_USEDEP}]
#		dev-python/aioresponses[${PYTHON_USEDEP}]
#		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
#		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
#		dev-python/pytest-cov[${PYTHON_USEDEP}]
#		dev-python/pytest-timeout[${PYTHON_USEDEP}]
#	)"

src_prepare() {
	# remove dynamic stuff and force version
	sed 's/dynamic = \[.*\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	sed 's/, "setuptools-git-versioning<2"//g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest

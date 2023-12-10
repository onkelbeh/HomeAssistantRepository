# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python wrapper for getting air quality data from Nettigo Air Monitor devices."
HOMEPAGE="https://github.com/bieniu/nettigo-air-monitor https://pypi.org/project/nettigo-air-monitor/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	$(python_gen_cond_dep '>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]' python3_12)
	$(python_gen_cond_dep '>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]' python3_11)
	dev-python/dacite[${PYTHON_USEDEP}]
	dev-python/aqipy-atmotech[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/pytest-runner[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

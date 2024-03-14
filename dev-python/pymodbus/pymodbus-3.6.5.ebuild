# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A fully featured modbus protocol stack in python"
HOMEPAGE="https://github.com/riptideio/pymodbus/ https://pypi.org/project/pymodbus/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="serial test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/typer-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.36[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.15.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	serial? (
		>=dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	 )"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed "s/aiohttp>=3.9.0b0/aiohttp/g" -i pyproject.toml || die

	# remove dynamic-versioning
	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die

	eapply_user
}

distutils_enable_tests pytest

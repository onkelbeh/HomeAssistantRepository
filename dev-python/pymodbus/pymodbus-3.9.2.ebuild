# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3_11 python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A fully featured modbus protocol stack in python"
HOMEPAGE="https://github.com/riptideio/pymodbus/ https://pypi.org/project/pymodbus/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="serial test repl simulator"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
	serial? (
		>=dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	)
	simulator? (
		$(python_gen_cond_dep '>=dev-python/aiohttp-3.8.6[${PYTHON_USEDEP}]' python3_11)
		$(python_gen_cond_dep '>=dev-python/aiohttp-3.10.6[${PYTHON_USEDEP}]' python3_12)
	)
	repl? (
		>=dev-python/pymodbus-repl-2.0.4[${PYTHON_USEDEP}]
	)"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-pyhton/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)"

src_prepare() {
	# remove dynamic-versioning
	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest

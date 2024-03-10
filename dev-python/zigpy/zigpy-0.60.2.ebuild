# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Library implementing a ZigBee stack"
HOMEPAGE="https://github.com/zigpy/zigpy https://pypi.org/project/zigpy/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/attrs[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/aiosqlite-0.16.0[${PYTHON_USEDEP}]
	dev-python/crccheck[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/async-timeout[${PYTHON_USEDEP}]' python3_10)
	dev-python/voluptuous[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/asynctest[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	# remove dynamic-versioning
	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	sed 's/, "setuptools-git-versioning<2"//g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest

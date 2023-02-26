# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="A fully featured modbus protocol stack in python"
HOMEPAGE="https://github.com/riptideio/pymodbus/ https://pypi.org/project/pymodbus/"
MY_PV=${PV/_/}
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${PN}-${MY_PV}.tar.gz"
S="${WORKDIR}/${PN}-${MY_PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="datastore serial test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
	>=dev-python/typer-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.8[${PYTHON_USEDEP}]
	datastore? (
		>=dev-python/redis-2.0.16[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-1.1.15[${PYTHON_USEDEP}]
	)
	serial? (
		>=dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	 )"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed "/prompt-toolkit==/c\prompt-toolkit" -i requirements.txt || die
	eapply_user
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

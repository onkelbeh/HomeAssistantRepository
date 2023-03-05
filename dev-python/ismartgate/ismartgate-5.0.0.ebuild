# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="iSmartGate and GogoGate2 API"
HOMEPAGE="https://github.com/bdraco/ismartgate https://pypi.org/project/ismartgate/"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/dicttoxml-1.7.4[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.9.8[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.18.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/respx[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

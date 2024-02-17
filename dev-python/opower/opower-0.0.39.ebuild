# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python library for getting historical and forecasted usage/cost from utilities that use opower.com such as PG&E"
HOMEPAGE="https://github.com/tronikos/opower https://pypi.org/project/opower/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.8[${PYTHON_USEDEP}]
	>=dev-python/arrow-1.2[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	rm src/demo.py
	distutils-r1_src_prepare
	}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

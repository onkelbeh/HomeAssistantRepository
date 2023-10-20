# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="SNI proxy with TCP multiplexer"
HOMEPAGE="https://github.com/NabuCasa/snitun/ https://www.nabucasa.com/ https://pypi.org/project/snitun/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/attrs-18.2.0[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-3.0.1[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.5[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

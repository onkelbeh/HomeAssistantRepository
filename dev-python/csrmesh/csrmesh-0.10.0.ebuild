# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Reverse engineered implementation of the CSRMesh bridge protocol"
HOMEPAGE="https://github.com/nkaminski/csrmesh https://pypi.org/project/csrmesh/"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/bluepy[${PYTHON_USEDEP}]
	dev-python/pycryptodomex[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

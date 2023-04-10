# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python library for EDL21 smart meters using Smart Message Language (SML)"
HOMEPAGE="https://github.com/mtdcr/pysml https://pypi.org/project/pysml/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/async-timeout-4.0[${PYTHON_USEDEP}]
	>=dev-python/bitstring-3.1.5[${PYTHON_USEDEP}]
	>=dev-python/pyserial-asyncio-0.6[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	# lots of top level vios:
	cat pyproject.toml | grep -v "from = " > x
	mv x pyproject.toml
	eapply_user
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

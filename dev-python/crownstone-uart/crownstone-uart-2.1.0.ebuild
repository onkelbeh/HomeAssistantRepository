# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION='Official Python lib for Crownstone: "Crownstone Unified System Bridge", or Crownstone USB implementation'
HOMEPAGE="https://github.com/crownstone/crownstone-lib-python-uart https://pypi.org/project/crownstone-uart/"
MY_PN="crownstone-lib-python-uart"
SRC_URI="https://github.com/crownstone/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/crownstone-core-3.0[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3.4[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1

DESCRIPTION="A small python library for discovery and interacting with Melnor, Eden, etc Bluetooth water timers."
HOMEPAGE=" https://pypi.org/project/melnor-bluetooth/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/bleak-0.14.2[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-1.11.0[${PYTHON_USEDEP}]
	>=dev-python/tzdata-2022.1[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-4.1[${PYTHON_USEDEP}]
	>=dev-python/aioconsole-0.4.1[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

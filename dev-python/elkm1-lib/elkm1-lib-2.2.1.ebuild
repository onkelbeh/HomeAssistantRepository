# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Library for interacting with ElkM1 alarm/automation panel."
HOMEPAGE="https://github.com/gwww/elkm1 https://pypi.org/project/elkm1-lib/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/pyserial-asyncio-0.5[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-4.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# "CHANGELOG.md", -> stray top-level files in site-packages

src_prepare() {
	sed 's/"CHANGELOG.md",//g' -i pyproject.toml || die
	eapply_user
}

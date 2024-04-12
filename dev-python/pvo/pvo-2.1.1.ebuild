# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous client for the PVOutput API."
HOMEPAGE="https://github.com/frenck/python-pvoutput https://pypi.org/project/pvo/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.10[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

src_prepare() {
	# remove unsupported dynamic-versioning
	sed 's/0.0.0/${PV}/g' -i pyproject.toml || die
	eapply_user
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

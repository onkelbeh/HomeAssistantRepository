# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Python Library for the Velbus protocol based on asyncio"
HOMEPAGE="https://github.com/Cereal2nd/velbus-aio https://pypi.org/project/velbus-aio/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/pyserial-asyncio-0.5[${PYTHON_USEDEP}]
	>=dev-python/backoff-1.10.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

src_prepare() {
	sed -e 's/"tests", "tests.*"/"tests", "tests.*", "examples"/' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest

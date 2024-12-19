# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python API for talking to Monoprice Blackbird 4k 8x8 HDBaseT Matrix"
HOMEPAGE="https://github.com/koolsb/pyblackbird https://pypi.org/project/pyblackbird/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"
src_prepare() {
	eapply "${FILESDIR}"/${P}-setup-fails.patch
	eapply_user

}
python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

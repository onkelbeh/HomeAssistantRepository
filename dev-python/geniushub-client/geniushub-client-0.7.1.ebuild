# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="An aiohttp-based client for Genius Hub systems"
HOMEPAGE="https://github.com/manzanotti/geniushub-client https://pypi.org/project/geniushub-client/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# VERSION = os.environ["GITHUB_REF_NAME"]
src_prepare() {
	sed -i "/VERSION =/c\VERSION = '${PV}'" setup.py || die
	eapply_user
}

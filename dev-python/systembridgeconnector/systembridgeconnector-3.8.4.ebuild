# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="System Bridge Connector"
HOMEPAGE="https://github.com/timmo001/system-bridge https://pypi.org/project/systembridgeconnector/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
	>=dev-python/incremental-22.10.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	echo -e "aiohttp>=3.8.1\nincremental>=22.10.0\npydantic>=1.9.0" > requirements.txt
	echo -e "incremental>=22.10.0" > requirements_setup.txt
	eapply_user
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

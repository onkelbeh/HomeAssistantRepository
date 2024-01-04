# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Library implementing EZSP"
HOMEPAGE="https://github.com/zigpy/bellows https://pypi.org/project/bellows/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/click[${PYTHON_USEDEP}]
	>=dev-python/click-log-0.2.1[${PYTHON_USEDEP}]
	~dev-python/pure-pcapy3-1.0.1[${PYTHON_USEDEP}]
	dev-python/voluptuous[${PYTHON_USEDEP}]
	>=dev-python/zigpy-0.54.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/asynctest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

src_prepare() {
	# remove dynamic-versioning
	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	sed 's/, "setuptools-git-versioning<2"//g' -i pyproject.toml || die
	eapply_user
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

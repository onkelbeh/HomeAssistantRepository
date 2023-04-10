# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python library for interfacing with Vizio SmartCast TVs and Sound Bars (2016+ models)"
HOMEPAGE="https://github.com/vkorn/pyvizio https://pypi.org/project/pyvizio/"

LICENSE="|| ( MIT GPL-3 )"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/jsonpickle[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.8.6[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.24.4[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

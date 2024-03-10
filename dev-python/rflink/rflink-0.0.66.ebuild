# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Library and CLI tools for interacting with RFlink 433MHz transceiver."
HOMEPAGE="https://github.com/aequitas/python-rflink https://pypi.org/project/rflink/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/docopt[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/pyserial-asyncio[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

# Patch for https://git.edevau.net/onkelbeh/HomeAssistantRepository/issues/25
src_prepare() {
	sed -e "s;version=version_from_git();version='${PV}';" -i setup.py
	eapply_user
}

distutils_enable_tests pytest

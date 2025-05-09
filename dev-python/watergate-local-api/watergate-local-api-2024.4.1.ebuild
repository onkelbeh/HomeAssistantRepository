# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Python package to interact with the Watergate Local API."
HOMEPAGE="https://pypi.org/project/watergate-local-api/ https://github.com/watergate-ai/watergate-local-api-python"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/aiohttp-3.10.10[${PYTHON_USEDEP}]
	>=dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
	>=dev-python/pytest-asyncio-0.24.0[${PYTHON_USEDEP}]
	>=dev-python/aioresponses-0.7.6[${PYTHON_USEDEP}]
"
src_prepare() {
	echo "${PVR}" >version.txt
	eapply_user
}
src_install() {
	default
	rm -rf "${D}/tests"
}
distutils_enable_tests pytest

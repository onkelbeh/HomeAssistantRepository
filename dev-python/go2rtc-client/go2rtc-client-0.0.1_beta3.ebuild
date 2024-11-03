# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Python client for go2rtc"
HOMEPAGE="https://github.com/home-assistant-libs/python-go2rtc-client/ https://pypi.org/project/go2rtc-client/"
MY_P=${P/_beta/b}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/awesomeversion[${PYTHON_USEDEP}]
	dev-python/mashumaro[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
	~dev-python/webrtc-models-0.1.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/aioresponses[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed 's/aiohttp~=3.10/aiohttp/g' -i pyproject.toml || die
	sed 's/awesomeversion~=24.6/awesomeversion/g' -i pyproject.toml || die
	sed 's/mashumaro~=3.13/mashumaro/g' -i pyproject.toml || die
	sed 's/orjson~=3.10/orjson/g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest

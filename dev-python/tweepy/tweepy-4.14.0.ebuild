# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Twitter library for Python"
HOMEPAGE="https://github.com/tweepy/tweepy/ https://www.tweepy.org/ https://pypi.org/project/tweepy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="async test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/requests-2.27.0[${PYTHON_USEDEP},socks5]
	>=dev-python/requests-oauthlib-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/oauthlib-3.2.0[${PYTHON_USEDEP}]
	async? (
		>=dev-python/aiohttp-3.7.3[${PYTHON_USEDEP}]
		>=dev-python/async-lru-1.0.3[${PYTHON_USEDEP}]
	)"
BDEPEND="
	test? (
		dev-python/aiohttp[${PYTHON_USEDEP}]
		>=dev-python/async-lru-1.0.3[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		<dev-python/urllib3-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/vcrpy-1.10.3[${PYTHON_USEDEP}]
	)"

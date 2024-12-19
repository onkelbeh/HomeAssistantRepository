# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Python module to talk to Logitech Squeezebox players directly (without Logitech server)."
HOMEPAGE="https://github.com/music-assistant/aioslimproto https://pypi.org/project/aioslimproto/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

BDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

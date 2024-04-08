# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="A wrapper for the Blue Current websocket api"
HOMEPAGE="https://github.com/bluecurrent/HomeAssistantAPI https://pypi.org/project/bluecurrent-api/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/websockets-10.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2023.4[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

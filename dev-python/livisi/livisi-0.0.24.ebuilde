# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="Livisi smart home connection library"
HOMEPAGE="
	https://pypi.org/project/livisi/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	=dev-python/colorlog-6.8.2[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.8.5[${PYTHON_USEDEP}]
	>=dev-python/websockets-11.0.3[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

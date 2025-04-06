# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
PYPI_NO_NORMALIZE="yes"
inherit distutils-r1 pypi

DESCRIPTION="Python client for qBittorrent v4.1+ Web API."
HOMEPAGE="https://github.com/rmartin16/qbittorrent-api https://pypi.org/project/qbittorrent-api/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND=">=dev-python/requests-2.16.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.24.2[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

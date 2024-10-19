# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_12 )

inherit distutils-r1 pypi

DESCRIPTION="Python asyncio module to interface with Anthem AVM and MRX receivers"
HOMEPAGE="https://pypi.org/project/pyeiscp/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/netifaces"
BDEPEND=""

distutils_enable_tests pytest

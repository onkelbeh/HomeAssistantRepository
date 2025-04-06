# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Python asyncio module to interface with Anthem AVM and MRX receivers"
HOMEPAGE="https://github.com/winterscar/python-eiscp https://pypi.org/project/pyeiscp/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="dev-python/netifaces"

distutils_enable_tests pytest

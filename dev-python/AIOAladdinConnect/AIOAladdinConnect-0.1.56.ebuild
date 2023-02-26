# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Python Async API for controlling Genie garage doors connected to Aladdin Connect devices"
HOMEPAGE="http://github.com/mkmer/AIOAladdinConnect https://pypi.org/project/AIOAladdinConnect/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="!dev-python/aladdin-connect
	dev-python/aiohttp[${PYTHON_USEDEP}]"

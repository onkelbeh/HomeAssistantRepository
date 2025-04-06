# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="tools and library for Habitica restful API (https://habitica.com)"
HOMEPAGE="https://github.com/ASMfreaK/habitipy https://pypi.org/project/habitipy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test emoji +aio"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/plumbum[${PYTHON_USEDEP}]
		 dev-python/requests[${PYTHON_USEDEP}]
		 emoji? ( dev-python/emoji[${PYTHON_USEDEP}] )
		 aio? ( dev-python/aiohttp[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest

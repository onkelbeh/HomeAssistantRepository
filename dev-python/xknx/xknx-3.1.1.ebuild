# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="An Asynchronous Library for the KNX protocol. Documentation: https://xknx.io/"
HOMEPAGE="https://github.com/XKNX/xknx/ https://xknx.io/ https://pypi.org/project/xknx/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="$(python_gen_cond_dep '>=dev-python/async-timeout-4.0.0[${PYTHON_USEDEP}]' python3_{9..10})
	>=dev-python/cryptography-35.0.0[${PYTHON_USEDEP}]
	>=dev-python/ifaddr-0.1.7[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

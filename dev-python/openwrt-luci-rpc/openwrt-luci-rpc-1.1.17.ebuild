# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
DESCRIPTION="Module for interacting with OpenWrt Luci RPC interface"
HOMEPAGE="https://github.com/fbradyirl/openwrt-luci-rpc https://pypi.org/project/openwrt-luci-rpc/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-19.1[${PYTHON_USEDEP}]
	>dev-python/click-6.0.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

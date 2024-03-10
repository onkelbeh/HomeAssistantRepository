# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python library for interfacing with ZhongHong HVAC controller"
HOMEPAGE="https://github.com/crhan/ZhongHongHVAC https://pypi.org/project/zhong-hong-hvac/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/attrs[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

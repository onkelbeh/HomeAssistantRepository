# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Wrapper for TP-Link Omada SDN Controller API (OC200/OC300/Software Controller)"
HOMEPAGE="https://github.com/MarkGodwin/tplink-omada-api https://pypi.org/project/tplink-omada-client/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/awesomeversion-22.9.0[${PYTHON_USEDEP}]
"

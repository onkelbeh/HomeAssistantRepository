# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="An async Python library for interacting with Bosch Alarm Panels supporting the 'Mode 2' API."
HOMEPAGE="
	https://pypi.org/project/bosch-alarm-mode2/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
"
BDEPEND=""

distutils_enable_tests pytest

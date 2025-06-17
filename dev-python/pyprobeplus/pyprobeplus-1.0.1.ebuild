# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="A generic library to interact with a Probe Plus BLE device"
HOMEPAGE="https://pypi.org/project/pyprobeplus/ https://github.com/pantherale0/pyprobeplus"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-python/bleak[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

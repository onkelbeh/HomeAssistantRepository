# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="Watch for USB devices to be plugged and unplugged"
HOMEPAGE="https://pypi.org/project/aiousbwatcher/ https://github.com/bluetooth-devices/aiousbwatcher"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/asyncinotify-4.2.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

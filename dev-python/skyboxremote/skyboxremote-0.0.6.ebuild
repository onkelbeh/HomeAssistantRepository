# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="A python library for controlling a sky box"
HOMEPAGE="https://pypi.org/project/skyboxremote/ https://github.com/dunnmj/skyboxremote"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

distutils_enable_tests pytest

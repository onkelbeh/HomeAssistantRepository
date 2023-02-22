# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="Python Bluetooth LE (Low Energy) and GATT Library"
HOMEPAGE="https://github.com/peplin/pygatt https://pypi.org/project/pygatt/"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

DOCS=( CHANGELOG.rst README.rst )

RDEPEND="dev-python/pyserial[${PYTHON_USEDEP}]"

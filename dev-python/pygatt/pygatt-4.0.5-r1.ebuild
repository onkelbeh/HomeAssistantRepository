# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Python Bluetooth LE (Low Energy) and GATT Library"
HOMEPAGE="https://github.com/peplin/pygatt https://pypi.org/project/pygatt/"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

DOCS=( CHANGELOG.rst README.rst )
IUSE="GATTTOOL"
RDEPEND="
	dev-lang/python[bluetooth]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/enum-compat[${PYTHON_USEDEP}]
	>=dev-python/coverage-3.7.1[${PYTHON_USEDEP}]
	>=dev-python/nose-1.3.7[${PYTHON_USEDEP}]
	GATTTOOL? ( dev-python/pexpect[${PYTHON_USEDEP}] )
"

# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="A library that provides cryptographic and general-purpose routines for Secure Systems Lab projects at NYU"
HOMEPAGE="https://github.com/secure-systems-lab/securesystemslib/ https://pypi.org/project/securesystemslib/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/cryptography-37.0.0[${PYTHON_USEDEP}]
	dev-python/PySPX[${PYTHON_USEDEP}]
	dev-python/PyKCS11[${PYTHON_USEDEP}]
	dev-python/asn1crypto[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

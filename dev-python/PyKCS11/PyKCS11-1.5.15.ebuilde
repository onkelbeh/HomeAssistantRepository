# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Full PKCS#11 wrapper for Python"
HOMEPAGE="https://github.com/LudovicRousseau/PyKCS11 https://pypi.org/project/PyKCS11/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/asn1crypto[${PYTHON_USEDEP}]"
BDEPEND="dev-lang/swig"

distutils_enable_tests pytest

# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="pure-Python, open source and free implementation of v1/v2c/v3 SNMP engine"
HOMEPAGE="https://github.com/lextudio/pysnmp https://pypi.org/project/pysnmp-lextudio/"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="!dev-python/pysnmplib
	!dev-python/pysnmp
	>=dev-python/pyasn1-0.4.8[${PYTHON_USEDEP}]
	>=dev-python/pysnmpcrypto-0.0.4[${PYTHON_USEDEP}]
	>=dev-python/pysmi-lextudio-1.3.0[${PYTHON_USEDEP}]"

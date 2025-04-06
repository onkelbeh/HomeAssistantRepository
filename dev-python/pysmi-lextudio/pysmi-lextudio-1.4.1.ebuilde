# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A pure-Python implementation of SNMP/SMI MIB parsing and conversion library."
HOMEPAGE="https://github.com/lextudio/pysmi https://pypi.org/project/pysmi-lextudio/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="!dev-python/pysmi
	!dev-python/pysnmp-pysmi
	>=dev-python/ply-3.11[${PYTHON_USEDEP}]
	>=dev-python/jinja-3.1.3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.26[${PYTHON_USEDEP}]"

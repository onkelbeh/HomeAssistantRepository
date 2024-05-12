# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A library to interface with the opentherm gateway through serial or network connection."
HOMEPAGE="https://github.com/mvn23/pyotgw https://pypi.org/project/pyotgw/"
MY_PV="${PV/_beta/b}"
SRC_URI="$(pypi_sdist_url "${PN}" "${MY_PV}")"
S="${WORKDIR}/${PN}-${MY_PV}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/pyserial-asyncio-fast[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python OWFS client library (owserver protocol)"
HOMEPAGE="https://github.com/miccoli/pyownet https://pypi.org/project/pyownet/"
MY_PV=${PV/_p/.post}
SRC_URI="$(pypi_sdist_url "${PN}" "${MY_PV}")"
S="${WORKDIR}/${PN}-${MY_PV}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

PATCHES=( "${FILESDIR}/pyownet-${PV}-2to3.patch" )

distutils_enable_tests pytest

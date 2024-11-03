# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
DESCRIPTION="Library to communicate with the Viessmann ViCare API"
HOMEPAGE="https://github.com/somm15/PyViCare https://pypi.org/project/PyViCare/"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
S="${WORKDIR}/${P,,}"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/Authlib-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

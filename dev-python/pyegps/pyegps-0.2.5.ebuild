# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Controlling Energenie Power Strips with python."
HOMEPAGE="https://github.com/gnumpi/pyegps https://pypi.org/project/pyEGPS/"
MY_PN="pyEGPS"
SRC_URI="$(pypi_sdist_url --no-normalize "$MY_PN")"
S="${WORKDIR}/${MY_PN}-${PV}"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/pyusb[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

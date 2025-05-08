# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
MY_PV=${PV/_alpha/a}
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="RPi.GPIO"
inherit distutils-r1 pypi

DESCRIPTION="A module to control Raspberry Pi GPIO channels"
HOMEPAGE="https://sourceforge.net/projects/raspberry-gpio-python/ https://pypi.org/project/RPi.GPIO/"
SRC_URI="$(pypi_sdist_url --no-normalize "${PYPI_PN}" "${MY_PV}" )"
S=${WORKDIR}/${PYPI_PN}-${MY_PV}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.txt"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

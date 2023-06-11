# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

MY_PV=${PV/_alpha/a}
DESCRIPTION="A Python client for Fixer.io"
HOMEPAGE="https://github.com/amatellanes/fixerio https://pypi.org/project/fixerio/"
SRC_URI="$(pypi_sdist_url "${PN}" "${MY_PV}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/requests-2.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S="${WORKDIR}/${PN}-${MY_PV}"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

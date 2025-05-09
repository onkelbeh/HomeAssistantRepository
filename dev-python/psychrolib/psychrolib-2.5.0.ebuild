# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="PsychroLib"
inherit distutils-r1 pypi
DESCRIPTION="Library of psychrometric functions to calculate thermodynamic properties of air"
HOMEPAGE="https://github.com/psychrometrics/psychrolib https://pypi.org/project/PsychroLib/"
SRC_URI="$(pypi_sdist_url --no-normalize "${PYPI_PN}" "${PV}" ".zip" )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

#DOCS="README.md"

BDEPEND="
	app-arch/unzip
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

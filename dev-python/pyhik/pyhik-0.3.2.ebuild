# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="pyHik"
inherit distutils-r1

DESCRIPTION="Hikvision camera event stream and toggle motion detection"
HOMEPAGE="https://github.com/mezz64/pyhik https://pypi.org/project/pyHik/"
SRC_URI="https://github.com/mezz64/pyHik/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PYPI_PN}-${PV}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Python bindings and utilities for GeoJSON"
HOMEPAGE="https://github.com/jazzband/geojson https://pypi.org/project/geojson/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"
PATCHES="${FILESDIR}/add-python-3.13.patch "
python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="A hierarchical, easy-to-use, powerful configuration module for Python"
HOMEPAGE="http://docs.red-dove.com/cfg/python.html https://pypi.org/project/config/"
SRC_URI="$(pypi_sdist_url "${PN}" "${PV}" ".zip")"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test ) mirror"

DOCS="README.md"

BDEPEND="
	app-arch/unzip
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

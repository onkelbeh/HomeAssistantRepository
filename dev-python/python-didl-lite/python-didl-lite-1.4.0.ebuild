# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="DIDL-Lite (Digital Item Declaration Language) tools for Python"
HOMEPAGE="https://github.com/StevenLooman/python-didl-lite/ https://pypi.org/project/python-didl-lite/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/defusedxml-0.6.0"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

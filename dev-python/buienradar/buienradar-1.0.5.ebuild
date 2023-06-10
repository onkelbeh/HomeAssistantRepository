# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Library and CLI tools for interacting with buienradar."
HOMEPAGE="https://github.com/mjj4791/python-buienradar https://pypi.org/project/buienradar/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
		 dev-python/xmltodict[${PYTHON_USEDEP}]
		 dev-python/vincenty[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

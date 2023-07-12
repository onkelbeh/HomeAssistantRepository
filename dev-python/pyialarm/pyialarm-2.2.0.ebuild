# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A simple library to interface with iAlarm systems, built for use with Home-Assistant"
HOMEPAGE="https://github.com/RyuzakiKK/pyialarm https://pypi.org/project/pyialarm/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/dicttoxml2[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

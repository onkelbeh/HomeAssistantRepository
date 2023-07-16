# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Converts between Gregorian dates and other calendar systems."
HOMEPAGE="https://github.com/fitnr/convertdate https://pypi.org/project/convertdate/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/pytz-2014.10
		 >=dev-python/PyMeeus-0.3.13"

distutils_enable_tests pytest

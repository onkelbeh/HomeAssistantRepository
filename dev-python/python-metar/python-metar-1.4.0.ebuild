# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Metar - a package to parse METAR coded weather reports"
HOMEPAGE="http://python-metar.sourceforge.net/ https://pypi.org/project/python-metar/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

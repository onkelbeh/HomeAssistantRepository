# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Open-source home automation platform running on Python 3."
HOMEPAGE="https://github.com/Cereal2nd/pyDuotecno https://pypi.org/project/pyDuotecno/"

LICENSE="Apache"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
DOCS="README.md"

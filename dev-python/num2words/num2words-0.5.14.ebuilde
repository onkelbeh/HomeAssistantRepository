# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="Modules to convert numbers to words. Easily extensible."
HOMEPAGE="
	https://pypi.org/project/num2words/
"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/docopt-0.6.2[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest

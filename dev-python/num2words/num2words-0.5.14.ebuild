# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Modules to convert numbers to words. Easily extensible."
HOMEPAGE="
	https://pypi.org/project/num2words/
"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/docopt-0.6.2[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest

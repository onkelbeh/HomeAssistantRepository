# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="pysmb is an experimental SMB/CIFS library written in Python"
HOMEPAGE="https://github.com/miketeo/pysmb"
SRC_URI="https://github.com/miketeo/pysmb/archive/refs/tags/${P}.tar.gz"
S="${WORKDIR}/${PN}-${P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

DOCS="README.md"

RDEPEND="dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/pyasn1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

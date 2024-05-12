# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Prayer Times Calculator - Offline"
HOMEPAGE="https://github.com/cpfair/prayer-times-calculator-offline/ https://pypi.org/project/prayer-times-calculator-offline/"
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.MD"

src_configure() {
	cat >> pyproject.toml <<-EOF
[build-system]
	requires = ["setuptools"]
	build-backend = "setuptools.build_meta"
EOF
}

distutils_enable_tests pytest

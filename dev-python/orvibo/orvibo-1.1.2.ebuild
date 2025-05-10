# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Control Orvibo products."
HOMEPAGE="https://github.com/happyleavesaoc/python-orvibo/ https://pypi.org/project/orvibo/"
MY_PN="python-orvibo"
SRC_URI="https://github.com/happyleavesaoc/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"
distutils_enable_tests pytest

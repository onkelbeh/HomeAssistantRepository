# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="Small python library for the Signal Cli REST API"
HOMEPAGE="https://github.com/bbernhard/pysignalclirestapi https://pypi.org/project/pysignalclirestapi/"
SRC_URI="https://github.com/bbernhard/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

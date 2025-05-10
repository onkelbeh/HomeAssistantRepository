# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Read data from GoodWe inverter via local network"
HOMEPAGE="https://github.com/marcelblijleven/goodwe https://pypi.org/project/goodwe/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

src_prepare() {
	echo "${PV}" > VERSION || die
	default
	}

distutils_enable_tests pytest

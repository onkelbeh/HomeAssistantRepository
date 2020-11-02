# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Connection to ATAG One Thermostat"
HOMEPAGE="https://github.com/MatsNl/pyatag https://pypi.org/project/pyatag/"

SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz
	https://github.com/MatsNl/pyatag/blob/0.3.3.4/requirements.txt"
# https://github.com/MatsNl/pyatag/archive/0.3.3.4.tar.gz
# SRC_URI="https://github.com/MatsNl/pyatag/archive/0.3.4.4.zip"
# https://github.com/MatsNl/pyatag/archive/0.3.4.4.tar.gz -> ${P}.tar.gz"
# https://codeload.github.com/MatsNl/pyatag/tar.gz/0.3.3.4
# SRC_URI="https://codeload.github.com/MatsNl/${PN}/tar.gz/${PV} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"
BDEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	echo "aiohttp" >> requirements.txt || die
	eapply_user
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

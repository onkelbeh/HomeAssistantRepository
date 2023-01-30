# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

MY_P=${PN/-/_}-${PV}
DESCRIPTION="API wrapper to communicate locally with SolarEdge Inverters"
HOMEPAGE="https://github.com/drobtravels/solaredge-local https://pypi.org/project/solaredge-local/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_P}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

S=${WORKDIR}/${MY_P}

RDEPEND="dev-python/uplink[${PYTHON_USEDEP}]
	dev-python/uplink-protobuf[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

MY_PN=${PN//-/_}
DESCRIPTION="An async GeoJSON client library for GeoNet NZ Quakes feed."
HOMEPAGE="https://github.com/exxamalte/python-aio-geojson-geonetnz-quakes https://pypi.org/project/aio-geojson-geonetnz-quakes/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/aiohttp-3.5.4[${PYTHON_USEDEP}]
	>=dev-python/pytz-2019.01[${PYTHON_USEDEP}]
	>=dev-python/aio-geojson-client-0.11[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S="${WORKDIR}/${MY_PN}-${PV}"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

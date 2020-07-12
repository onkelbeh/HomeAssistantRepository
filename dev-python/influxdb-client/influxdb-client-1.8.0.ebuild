# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="InfluxDB 2.0 Python client library"
HOMEPAGE="https://github.com/influxdata/influxdb-client-python https://pypi.org/project/influxdb-client/"
MY_PN=${PN/-/_}
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/Rx-3.0.1
	>=dev-python/certifi-14.05.14
	>=dev-python/six-1.10
	>=dev-python/python-dateutil-2.5.3
	>=dev-python/urllib3-1.15.1
	>=dev-python/ciso8601-2.1.1
	>=dev-python/pytz-2019.1
"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -e "s;packages=find_packages();packages=find_packages(exclude=['tests', 'docs']);" \
		-i setup.py
	eapply_user
	}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

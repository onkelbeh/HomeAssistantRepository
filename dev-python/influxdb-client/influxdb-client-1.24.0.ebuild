# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="InfluxDB 2.0 Python client library"
HOMEPAGE="https://github.com/influxdata/influxdb-client-python https://pypi.org/project/influxdb-client/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/Rx-3.0.1
	>=dev-python/certifi-14.05.14
	>=dev-python/six-1.10
	>=dev-python/python-dateutil-2.5.3
	>=dev-python/urllib3-1.15.1
	>=dev-python/pytz-2019.1
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -e "s;packages=find_packages();packages=find_packages(exclude=['tests', 'docs']);" \
		-i setup.py
	eapply_user
	}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

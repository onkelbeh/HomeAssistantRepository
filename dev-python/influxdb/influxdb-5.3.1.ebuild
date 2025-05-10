# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="InfluxDB client"
HOMEPAGE="https://github.com/influxdb/influxdb-python https://pypi.org/project/influxdb/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/msgpack-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.6.0[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	>=dev-python/requests-2.17.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
"
BDEPEND="test? (
		dev-db/influxdb
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/requests-mock[${PYTHON_USEDEP}]
	)"

PATCHES=( "${FILESDIR}/${P}-pandas-future-warning.patch" )

src_prepare() {
	# The tarball is missing this file.
	# <https://github.com/influxdata/influxdb-python/issues/714>
	cp "${FILESDIR}/influxdb.conf.template" "${S}/influxdb/tests/server_tests/influxdb.conf.template" || die
	default
}

distutils_enable_tests pytest

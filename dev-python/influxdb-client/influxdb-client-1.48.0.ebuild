# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3_11 python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="InfluxDB 2.0 Python client library"
HOMEPAGE="https://github.com/influxdata/influxdb-client-python https://pypi.org/project/influxdb-client/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/reactivex-4.0.4[${PYTHON_USEDEP}]
	>=dev-python/certifi-14.05.14[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.5.3[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.0[${PYTHON_USEDEP}]"

src_prepare() {
	sed -e "s;packages=find_packages();packages=find_packages(exclude=['tests', 'docs']);" \
		-i setup.py || die
	eapply_user
	}

distutils_enable_tests pytest

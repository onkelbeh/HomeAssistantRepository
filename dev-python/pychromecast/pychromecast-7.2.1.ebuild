# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 )
inherit distutils-r1

DESCRIPTION="Python module to talk to Google Chromecast."
HOMEPAGE="https://github.com/balloob/pychromecast https://pypi.org/project/PyChromecast/"
MY_PN="PyChromecast"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_PN}-${PV}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64 x86 amd64-linux x86-linux"
IUSE="test"

RDEPEND="${DEPEND}
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-python-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.25.1[${PYTHON_USEDEP}]
	>=dev-python/casttube-0.2.0[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		  dev-python/nose[${PYTHON_USEDEP}]
		  dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

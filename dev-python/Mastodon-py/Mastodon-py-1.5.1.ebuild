# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Python wrapper for the Mastodon API"
HOMEPAGE="https://github.com/halcy/Mastodon.py https://pypi.org/project/Mastodon.py/"
MY_PN=${PN/-/.}
MY_P=${MY_PN}-${PV}
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_P}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/requests-2.4.2[${PYTHON_USEDEP}]
		 dev-python/python-dateutil[${PYTHON_USEDEP}]
		 dev-python/six[${PYTHON_USEDEP}]
		 dev-python/pytz[${PYTHON_USEDEP}]
		 dev-python/python-magic[${PYTHON_USEDEP}]
		 >=dev-python/decorator-4.0.0[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="A modern/fast Python SOAP client based on lxml / requests"
HOMEPAGE="http://docs.python-zeep.org https://pypi.org/project/zeep/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="+async test tornado"

DOCS=( README.rst CHANGES )

RDEPEND="${DEPEND}
	>=dev-python/appdirs-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/attrs-17.2.0[${PYTHON_USEDEP}]
	>=dev-python/cached-property-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/isodate-0.5.4[${PYTHON_USEDEP}]
	>=dev-python/lxml-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	async? ( >=dev-python/aiohttp-1.0[${PYTHON_USEDEP}] )
	tornado? ( >=www-servers/tornado-4.0.2[${PYTHON_USEDEP}]
			   <www-servers/tornado-5[${PYTHON_USEDEP}] )"
BDEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

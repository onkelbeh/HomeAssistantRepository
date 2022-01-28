# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="the first third-party instant messaging client for Google Hangouts"
HOMEPAGE="https://github.com/tdryer/hangups https://pypi.org/project/hangups/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS="README.rst"

RDEPEND="~dev-python/configargparse-0.11.0[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/async_timeout[${PYTHON_USEDEP}]
	>=dev-python/appdirs-1.4[${PYTHON_USEDEP}]
	~dev-python/readlike-0.1.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.6.0[${PYTHON_USEDEP}]
	~dev-python/ReParser-1.4.3[${PYTHON_USEDEP}]
	>=dev-python/protobuf-python-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/urwid-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/MechanicalSoup-0.6.0[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

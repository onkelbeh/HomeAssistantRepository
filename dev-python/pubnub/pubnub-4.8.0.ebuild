# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="PubNub Real-time push service in the cloud"
HOMEPAGE="http://pubnub.com https://pypi.org/project/pubnub/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS=""

RDEPEND=">=dev-python/pycryptodomex-3.3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.4[${PYTHON_USEDEP}]
	>=dev-python/six-1.10[${PYTHON_USEDEP}]
	dev-python/cbor2[${PYTHON_USEDEP}]"
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

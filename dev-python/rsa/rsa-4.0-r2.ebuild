# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Pure-Python RSA implementation"
HOMEPAGE="https://stuvel.eu/rsa https://pypi.org/project/rsa/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/pyasn1-0.1.3[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	>=dev-python/setuptools-0.6.10[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		>=dev-python/poetry-0.12[${PYTHON_USEDEP}]
		dev-python/unittest2[${PYTHON_USEDEP}]
		)
	"

python_test() {
	nosetests --verbose || die
}

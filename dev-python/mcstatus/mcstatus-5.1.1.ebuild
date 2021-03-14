# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

DESCRIPTION="A library to query Minecraft Servers for their status and capabilities."
HOMEPAGE="https://github.com/Dinnerbone/mcstatus https://pypi.python.org/pypi/mcstatus https://pypi.org/project/mcstatus/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS="README.md"

RDEPEND=">=dev-python/asyncio-dgram-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/click-7.1.1[${PYTHON_USEDEP}]
	>=dev-python/dnspython-1.15.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.14.0[${PYTHON_USEDEP}]"
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

src_prepare() {
	echo "asyncio-dgram>=1.2.0\nclick>=7.1.1\ndnspython3>=1.15.0\nsix>=1.14.0" > requirements.txt
	echo "-r requirements.txt" > test-requirements.txt
	eapply_user
	}

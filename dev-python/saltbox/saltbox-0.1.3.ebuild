# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Interface with your Salt Fiber Box router in python."
HOMEPAGE="https://github.com/bjornorri/pysaltbox https://pypi.org/project/saltbox/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="
	~dev-python/beautifulsoup4-4.8.2[${PYTHON_USEDEP}]
	~dev-python/certifi-2019.11.28[${PYTHON_USEDEP}]
	~dev-python/chardet-3.0.4[${PYTHON_USEDEP}]
	~dev-python/idna-2.8[${PYTHON_USEDEP}]
	~dev-python/requests-2.22.0[${PYTHON_USEDEP}]
	~dev-python/soupsieve-1.9.5[${PYTHON_USEDEP}]
	~dev-python/urllib3-1.25.7[${PYTHON_USEDEP}]"
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

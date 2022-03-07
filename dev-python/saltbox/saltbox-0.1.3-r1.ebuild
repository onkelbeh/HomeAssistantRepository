# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Interface with your Salt Fiber Box router in python."
HOMEPAGE="https://github.com/bjornorri/pysaltbox https://pypi.org/project/saltbox/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/chardet[${PYTHON_USEDEP}]
	dev-python/idna[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/soupsieve[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]"
BDEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
			  echo "beautifulsoup4" > requirements.txt
			  echo "certifi" >> requirements.txt
			  echo "chardet" >> requirements.txt
			  echo "idna" >> requirements.txt
			  echo "requests" >> requirements.txt
			  echo "soupsieve" >> requirements.txt
			  echo "urllib3" >> requirements.txt
			  eapply_user
}

python_test() {
	nosetests --verbose
	py.test -v -v
}

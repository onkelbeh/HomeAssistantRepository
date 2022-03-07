# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..9} )

inherit distutils-r1

DESCRIPTION="A aiohttp-based client for Intergas InComfort/InTouch Lan2RF systems"
HOMEPAGE="https://github.com/zxdavb/incomfort-client https://pypi.org/project/incomfort-client/"
# Pypi SDIST is missing (at least) requirements.txt
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
SRC_URI="https://github.com/zxdavb/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	~dev-python/async_timeout-3.0.1[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
	~dev-python/chardet-3.0.4[${PYTHON_USEDEP}]
	dev-python/idna[${PYTHON_USEDEP}]
	~dev-python/idna-ssl-1.1.0[${PYTHON_USEDEP}]
	dev-python/multidict[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]"
BDEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed "s/aiohttp==3.5.4/aiohttp/g" -i requirements.txt || die
	sed "s/attrs==19.1.0/attrs/g" -i requirements.txt || die
	sed "s/idna==2.8/idna/g" -i requirements.txt || die
	sed "s/multidict==4.5.2/multidict/g" -i requirements.txt || die
	sed "s/typing-extensions==3.7.2/typing-extensions/g" -i requirements.txt || die
	sed "s/yarl==1.3.0/yarl/g" -i requirements.txt || die
	eapply_user
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

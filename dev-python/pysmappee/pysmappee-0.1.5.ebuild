# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7,8} )

inherit distutils-r1

DESCRIPTION="Offical Smappee dev API and MQTT python wrapper"
HOMEPAGE="https://github.com/smappee/pysmappee https://pypi.org/project/pysmappee/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=""
BDEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

# packages=find_packages()
# https://git.edevau.net/onkelbeh/HomeAssistantRepository/issues/104
src_prepare() {
	sed -i "s/packages=setuptools.find_packages()/packages=setuptools.find_packages(exclude=['test','test.*'])/g" -i setup.py || die
	eapply_user
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

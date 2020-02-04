# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

DESCRIPTION="Pusher websocket client for python, based on Erik Kulyk's PythonPusherClient"
HOMEPAGE="https://github.com/nlsdfnbch/Pysher https://pypi.org/project/Pysher/"
#SRC_URI="https://github.com/nlsdfnbch/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
# add the missing version
SRC_URI="https://github.com/onkelbeh/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="~dev-python/autobahn-18.7.1[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	~dev-python/txaio-18.7.1[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.51.0[${PYTHON_USEDEP}]"
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

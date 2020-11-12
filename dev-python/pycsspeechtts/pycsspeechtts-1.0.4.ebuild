# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Python 3 interface to Microsoft Cognitive Services Text To Speech"
HOMEPAGE="https://github.com/jeroenterheerdt/pycsspeechtts https://pypi.org/project/pycsspeechtts/"
# PYPI SDIST IS IMCOMPLETE
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
COMMITID="44049cb2e1f173eed9d58e61ab97a8b4d40b5e0a"
SRC_URI="https://github.com/jeroenterheerdt/pycsspeechtts/archive/${COMMITID}.zip -> ${P}.zip"
S="${WORKDIR}/${PN}-${COMMITID}/src/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/requests-2.0[${PYTHON_USEDEP}]"
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

# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Python API for interacting with ESPHome devices."
HOMEPAGE="https://esphome.io/ https://pypi.org/project/aioesphomeapi/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz
		 https://raw.githubusercontent.com/esphome/${PN}/v${PV}/requirements.txt"
#SRC_URI="https://github.com/esphome/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/attrs-19.3.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-python-3.12.2[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.28.0[${PYTHON_USEDEP}]"
BDEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
	)"

src_prepare() {
#	sed -e 's;pylint==2.5.3;pylint;' \
	#		-i requirements_test.txt || die
	cp ${DISTDIR}/requirements.txt ${S}
	eapply_user
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

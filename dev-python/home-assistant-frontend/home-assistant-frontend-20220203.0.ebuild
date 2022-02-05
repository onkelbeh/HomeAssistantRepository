# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="The Home Assistant frontend"
HOMEPAGE="https://github.com/home-assistant/frontend https://pypi.org/project/home-assistant-frontend/"

# SDIST missing on Pypi
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
# use Github instead
MY_PN="frontend"
SRC_URI="https://github.com/home-assistant/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
#KEYWORDS="amd64 ~arm ~arm64 x86 amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="~dev-python/user-agents-2.0[${PYTHON_USEDEP}]"
BDEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

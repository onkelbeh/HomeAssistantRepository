# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

MY_PN=${PN/-/_}
DESCRIPTION="WIP Python library for the Awair GraphQL API."
HOMEPAGE="https://github.com/ahayworth/python_awair https://pypi.org/project/python-awair/"
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"
#SRC_URI="https://github.com/ahayworth/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/aiohttp-3.4.4[${PYTHON_USEDEP}]
	dev-python/async_timeout[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S="${WORKDIR}/${MY_PN}-${PV}"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

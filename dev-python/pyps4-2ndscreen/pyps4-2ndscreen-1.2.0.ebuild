# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="PS4 2nd Screen Python Library"
HOMEPAGE="https://github.com/ktnrg45/pyps4-2ndscreen https://pypi.org/project/pyps4-2ndscreen/"

# Pypi SDIST is incomplete
# https://git.edevau.net/onkelbeh/HomeAssistantRepository/issues/68
# https://github.com/ktnrg45/pyps4-2ndscreen/pull/46
SRC_URI="https://github.com/ktnrg45/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS="README.rst"

RDEPEND=">=dev-python/construct-2.9.45[${PYTHON_USEDEP}]
	>=dev-python/pycryptodomex-3.7.2[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.5.4[${PYTHON_USEDEP}]
	>=dev-python/click-7.0[${PYTHON_USEDEP}]"
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

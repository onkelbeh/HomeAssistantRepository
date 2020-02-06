# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

MY_PN=${PN/-/_}
MY_P=${MY_PN}-${PV}

DESCRIPTION="HomeKit Python"
HOMEPAGE="https://github.com/jlusiardi/homekit_python https://pypi.org/project/homekit/"
SRC_URI="https://github.com/jlusiardi/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"
S=${WORKDIR}/${MY_P}

RDEPEND=">=dev-python/cryptography-2.5[${PYTHON_USEDEP}]
		 dev-python/zeroconf[${PYTHON_USEDEP}]
		 dev-python/hkdf[${PYTHON_USEDEP}]
		 dev-python/ed25519[${PYTHON_USEDEP}]
		 dev-python/dbus-python[${PYTHON_USEDEP}]
		 dev-python/pycairo[${PYTHON_USEDEP}]
		 dev-python/pygobject[${PYTHON_USEDEP}]
		 dev-python/gatt[${PYTHON_USEDEP}]
		 dev-python/coverage[${PYTHON_USEDEP}]"
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

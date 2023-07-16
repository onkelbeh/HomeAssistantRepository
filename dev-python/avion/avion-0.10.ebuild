# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Python API for controlling Avi-on Bluetooth dimmers"
HOMEPAGE="https://github.com/mjg59/python-avion https://pypi.org/project/avion/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/requests-2.18.4[${PYTHON_USEDEP}]
	>=dev-python/bluepy-1.1.4[${PYTHON_USEDEP}]
	>=dev-python/csrmesh-0.9.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -e "s;packages=find_packages();packages=['avion'];" \
		-i setup.py || die
	sed -e "s;'bluepy>==1.1.4',;'bluepy>=1.1.4',;" -i setup.py || die
	eapply_user
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

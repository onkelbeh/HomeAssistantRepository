# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN=${PN/-/_}
inherit distutils-r1 pypi

DESCRIPTION="GPIO interface on the Raspberry Pi."
HOMEPAGE="https://github.com/adafruit/Adafruit_Python_GPIO/ https://pypi.org/project/Adafruit-GPIO/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/Adafruit-PureIO[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

src_prepare() {
	sed "s/find_packages()/find_packages(exclude=['tests'])/g" -i setup.py || die
	eapply_user
}

distutils_enable_tests pytest

# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS=pyproject.toml

inherit distutils-r1

DESCRIPTION="Python program and library to control Wi-Fi enabled iRobot Roombas"
HOMEPAGE="https://github.com/pschmitt/roombapy https://pypi.org/project/roombapy/"
SRC_URI="https://github.com/pschmitt/roombapy/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86 ~amd64-linux ~x86-linux"
IUSE="test +mqtt"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="mqtt? ( >=dev-python/paho-mqtt-1.5.1[${PYTHON_USEDEP}] )"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/pyproject2setuppy-9[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

src_prepare() {
	sed -i "s/exclude/# exclude/g" -i pyproject.toml || die
	eapply_user
}

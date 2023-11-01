# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Offical Smappee dev API and MQTT python wrapper"
HOMEPAGE="https://github.com/smappee/pysmappee https://pypi.org/project/pysmappee/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/cachetools-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/paho-mqtt-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2019.3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.23.0[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/schedule-1.1.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

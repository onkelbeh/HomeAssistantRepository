# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Simple API to access Netatmo weather station data from any Python 3 script. Designed for Home Assistant (but not only)"
HOMEPAGE="https://github.com/jabesq/pyatmo https://pypi.org/project/pyatmo/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.7.4_p0[${PYTHON_USEDEP}]
	>=dev-python/oauthlib-3.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.24[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-1.3[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

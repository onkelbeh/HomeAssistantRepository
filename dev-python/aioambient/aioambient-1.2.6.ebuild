# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="A clean, async-friendly library for the Ambient Weather API"
HOMEPAGE="https://github.com/bachya/aioambient https://pypi.org/project/aioambient/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86 amd64-linux ~x86-linux"
IUSE="test"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	>=dev-python/python-socketio-4.6[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-3.13.1[${PYTHON_USEDEP}]
	>=dev-python/websockets-8.1[${PYTHON_USEDEP}]"
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

# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Home Assistant cloud integration by Nabu Casa, Inc."
HOMEPAGE="https://www.nabucasa.com/ https://github.com/NabuCasa/hass-nabucasa/ https://pypi.org/project/hass-nabucasa/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 x86 amd64-linux x86-linux"
IUSE="test"

DOCS="README.md"

RDEPEND="~dev-python/pycognito-2021.3.1[${PYTHON_USEDEP}]
	~dev-python/snitun-0.30.0[${PYTHON_USEDEP}]
	>=app-crypt/acme-1.18.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.8[${PYTHON_USEDEP}]
	>=dev-python/attrs-19.3.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2019.3[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}]
	~dev-python/atomicwrites-1.4.0[${PYTHON_USEDEP}]"
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

src_prepare() {
	sed -i "s/acme==1.18.0/acme/g" -i setup.py || die
	eapply_user
}

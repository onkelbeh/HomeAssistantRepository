# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

MY_PN=${PN//-/_}
DESCRIPTION="Async UPnP Client"
HOMEPAGE="https://github.com/StevenLooman/async_upnp_client https://pypi.org/project/async-upnp-client/"
SRC_URI="https://github.com/StevenLooman/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86 amd64-linux x86-linux"
IUSE="test"

RDEPEND="
		>=dev-python/voluptuous-0.12.1[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
		>=dev-python/async_timeout-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/python-didl-lite-1.2.6[${PYTHON_USEDEP}]
		>=dev-python/defusedxml-0.6.0[${PYTHON_USEDEP}]
		"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S=${WORKDIR}/${MY_PN}-${PV}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

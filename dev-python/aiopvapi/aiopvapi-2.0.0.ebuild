# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Powerview blinds API wrapper"
HOMEPAGE="https://github.com/sander76/aio-powerview-api https://pypi.org/project/aiopvapi/"
EGIT_COMMIT="d46cbf0c641af2c56bff75574c9d6d16c3ce2257"
MY_PN="aio-powerview-api"
SRC_URI="https://github.com/sander76/${MY_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S=${WORKDIR}/${MY_PN}-${EGIT_COMMIT}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="dev-python/async-timeout[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

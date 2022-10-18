# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="PyiCloud is a module which allows pythonistas to interact with iCloud webservices."
HOMEPAGE="https://github.com/picklepete/pyicloud https://pypi.org/project/pyicloud/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/requests-2.24[${PYTHON_USEDEP}]
	>=dev-python/keyring-21.4.0[${PYTHON_USEDEP}]
	>=dev-python/keyrings_alt-3.5.2[${PYTHON_USEDEP}]
	>=dev-python/click-7.1.2[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-4.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2020.6.20[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

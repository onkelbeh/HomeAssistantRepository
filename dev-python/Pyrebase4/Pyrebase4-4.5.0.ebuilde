# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
DESCRIPTION="A simple python wrapper for the Firebase API with current deps"
HOMEPAGE="https://github.com/nhorvath/Pyrebase4 https://pypi.org/project/Pyrebase4/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/requests-2.19.1[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/gcloud-0.18.3[${PYTHON_USEDEP}]
	>=dev-python/oauth2client-4.1.2[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.6.4[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

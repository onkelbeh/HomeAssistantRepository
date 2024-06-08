# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python class to integrate Boto3's Cognito client so it is easy to login users. With SRP support."
HOMEPAGE="https://github.com/pvizeli/pycognito https://pypi.org/project/pycognito/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/boto3-1.10.49[${PYTHON_USEDEP}]
		 >=dev-python/envs-1.3[${PYTHON_USEDEP}]
		 >=dev-python/python-jose-3.2.0[${PYTHON_USEDEP}]
		 >=dev-python/requests-2.22.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

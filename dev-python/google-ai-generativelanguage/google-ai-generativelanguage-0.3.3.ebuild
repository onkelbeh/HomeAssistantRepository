# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Google Ai Generativelanguage API client library"
HOMEPAGE="https://github.com/googleapis/google-cloud-python https://pypi.org/project/google-ai-generativelanguage/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/google-api-core-1.34.0[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.22.2[${PYTHON_USEDEP}]
	>=dev-python/protobuf-python-3.19.5[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

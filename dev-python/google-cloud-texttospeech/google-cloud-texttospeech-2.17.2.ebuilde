# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Google Cloud Text-to-Speech API client library"
HOMEPAGE="https://github.com/googleapis/python-texttospeech https://pypi.org/project/google-cloud-texttospeech/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/google-api-core-1.34.1[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.22.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.19.5[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

python_install_all() {
	distutils-r1_python_install_all
	find "${ED}" -name '*.pth' -delete || die
}

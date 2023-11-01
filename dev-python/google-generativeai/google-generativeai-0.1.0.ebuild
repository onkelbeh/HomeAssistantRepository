# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1

DESCRIPTION="Google Generative AI High level API client library and tools."
HOMEPAGE="https://github.com/google/generative-ai-python https://pypi.org/project/google-generativeai/"
MY_PN="generative-ai-python"
SRC_URI="https://github.com/google/generative-ai-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S=${WORKDIR}/${MY_PN}-${PV}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="~dev-python/google-ai-generativelanguage-0.3.3[${PYTHON_USEDEP}]
	dev-python/google-auth[${PYTHON_USEDEP}]
	dev-python/google-api-core[${PYTHON_USEDEP}]
	dev-python/protobuf-python[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

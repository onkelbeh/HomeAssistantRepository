# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="GenAI Python SDK"
HOMEPAGE="https://github.com/googleapis/python-genai https://pypi.org/project/google-genai/"
SRC_URI="https://github.com/googleapis/python-genai/archive/refs/tags/v${PV}.tar.gz"
PATCHES="${FILESDIR}/${PN}-build-system.patch"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/google-auth-2.14.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.28.1[${PYTHON_USEDEP}]
	>=dev-python/websockets-13.0[${PYTHON_USEDEP}]
"
BDEPEND=""
src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}/python-genai-${PV}" "${S}"
}

distutils_enable_tests pytest

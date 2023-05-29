# Copyright 2008-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/protocolbuffers/protobuf"
	EGIT_SUBMODULES=()
fi

DESCRIPTION="Google's Protocol Buffers - Python bindings"
HOMEPAGE="
	https://developers.google.com/protocol-buffers/
	https://github.com/protocolbuffers/protobuf/
	https://pypi.org/project/protobuf/
"
if [[ "${PV}" != "9999" ]]; then
	SRC_URI="
		https://github.com/protocolbuffers/protobuf/archive/v${PV}.tar.gz
			-> protobuf-${PV}.gh.tar.gz
	"
fi
S="${WORKDIR}/protobuf-${PV}/python"

LICENSE="BSD"
SLOT="0/30"
KEYWORDS="amd64 arm arm64 x86"

BDEPEND="
	${PYTHON_DEPS}
	~dev-libs/protobuf-${PV}
	dev-python/six[${PYTHON_USEDEP}]
"
DEPEND="
	${PYTHON_DEPS}
	~dev-libs/protobuf-${PV}
"
RDEPEND="
	${BDEPEND}
"

if [[ "${PV}" == "9999" ]]; then
	EGIT_CHECKOUT_DIR="${WORKDIR}/protobuf-${PV}"
fi

distutils_enable_tests setup.py

src_configure() {
	DISTUTILS_ARGS=(--cpp_implementation)
}

python_compile() {
	distutils-r1_python_compile
	find "${BUILD_DIR}/install" -name "*.pth" -type f -delete || die
}

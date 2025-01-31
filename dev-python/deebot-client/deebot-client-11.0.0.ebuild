# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=maturin
CRATES="
	autocfg@1.4.0
	base64@0.22.1
	cfg-if@1.0.0
	heck@0.5.0
	indoc@2.0.5
	libc@0.2.169
	memoffset@0.9.1
	once_cell@1.20.2
	pkg-config@0.3.31
	portable-atomic@1.10.0
	proc-macro2@1.0.93
	pyo3-build-config@0.23.4
	pyo3-ffi@0.23.4
	pyo3-macros-backend@0.23.4
	pyo3-macros@0.23.4
	pyo3@0.23.4
	quote@1.0.38
	rust-lzma@0.6.0
	syn@2.0.96
	target-lexicon@0.12.16
	unicode-ident@1.0.14
	unindent@0.2.3
	vcpkg@0.2.15
"
inherit cargo distutils-r1 pypi

DESCRIPTION="Deebot client library in python 3"
HOMEPAGE="https://github.com/DeebotUniverse/client.py https://pypi.org/project/deebot-client/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"
SRC_URI="
	https://github.com/DeebotUniverse/client.py/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/xavierforestier/deebot-client/releases/download/v${PV}/deebot_client-v${PV}-crates.tar.xz
"
RDEPEND=">=dev-python/aiohttp-3.10[${PYTHON_USEDEP}]
	>=dev-python/aiomqtt-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/cachetools-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.23.2[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.0.1[${PYTHON_USEDEP}]
	>=dev-python/svg-py-1.4.2[${PYTHON_USEDEP}]"
BDEPEND="dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	dev-python/pytest-timeout[${PYTHON_USEDEP}]
	>=dev-python/pycountry-24.6.1[${PYTHON_USEDEP}]"
src_unpack() {
	default
	mv "${WORKDIR}/client.py-${PV}" $S
	cargo_src_unpack
}
distutils_enable_tests pytest

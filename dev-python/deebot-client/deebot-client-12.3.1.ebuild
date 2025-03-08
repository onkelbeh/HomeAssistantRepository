# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CARGO_OPTIONAL=1
PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=maturin
CRATES="
	adler2@2.0.0
	aho-corasick@1.1.3
	arc-swap@1.7.1
	autocfg@1.4.0
	base64@0.22.1
	bitflags@1.3.2
	bytemuck@1.21.0
	byteorder-lite@0.1.0
	byteorder@1.5.0
	cc@1.2.16
	cfg-if@1.0.0
	crc32fast@1.4.2
	equivalent@1.0.2
	fdeflate@0.3.7
	flate2@1.1.0
	futures-core@0.3.31
	futures-macro@0.3.31
	futures-task@0.3.31
	futures-timer@3.0.3
	futures-util@0.3.31
	glob@0.3.2
	hashbrown@0.15.2
	heck@0.5.0
	image@0.25.5
	indexmap@2.7.1
	indoc@2.0.5
	jobserver@0.1.32
	libc@0.2.170
	liblzma-sys@0.3.13
	liblzma@0.3.6
	log@0.4.26
	memchr@2.7.4
	memoffset@0.9.1
	miniz_oxide@0.8.5
	num-traits@0.2.19
	once_cell@1.20.3
	pin-project-lite@0.2.16
	pin-utils@0.1.0
	pkg-config@0.3.31
	png@0.17.16
	portable-atomic@1.11.0
	proc-macro-crate@3.2.0
	proc-macro2@1.0.93
	pyo3-build-config@0.23.5
	pyo3-ffi@0.23.5
	pyo3-log@0.12.1
	pyo3-macros-backend@0.23.5
	pyo3-macros@0.23.5
	pyo3@0.23.5
	quote@1.0.38
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	relative-path@1.9.3
	rstest@0.24.0
	rstest_macros@0.24.0
	rustc_version@0.4.1
	semver@1.0.25
	shlex@1.3.0
	simd-adler32@0.3.7
	slab@0.4.9
	svg@0.18.0
	syn@2.0.98
	target-lexicon@0.12.16
	toml_datetime@0.6.8
	toml_edit@0.22.24
	unicode-ident@1.0.17
	unindent@0.2.3
	winnow@0.7.3
	zstd-safe@7.2.3
	zstd-sys@2.0.14+zstd.1.5.7
	zstd@0.13.3
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
	$(cargo_crate_uris ${CRATES})
"
RDEPEND=">=dev-python/aiohttp-3.10[${PYTHON_USEDEP}]
	>=dev-python/aiomqtt-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/cachetools-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
"
BDEPEND="dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	dev-python/pytest-timeout[${PYTHON_USEDEP}]
	>=dev-python/pycountry-24.6.1[${PYTHON_USEDEP}]"
src_unpack() {
	default
	mv "${WORKDIR}/client.py-${PV}" $S
	cargo_src_unpack
}
distutils_enable_tests pytest

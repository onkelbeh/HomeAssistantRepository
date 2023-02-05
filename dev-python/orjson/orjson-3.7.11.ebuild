# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

CARGO_OPTIONAL=1
CRATES="
	ahash-0.7.6
	arrayvec-0.7.2
	associative-cache-1.0.1
	autocfg-1.1.0
	beef-0.5.2
	bytecount-0.6.3
	castaway-0.2.2
	cc-1.0.73
	cfg-if-1.0.0
	chrono-0.4.19
	compact_str-0.5.2
	encoding_rs-0.8.31
	getrandom-0.2.7
	inlinable_string-0.1.15
	itoa-1.0.2
	libc-0.2.126
	libm-0.1.4
	num-integer-0.1.45
	num-traits-0.2.15
	once_cell-1.13.0
	packed_simd_2-0.3.8
	pyo3-build-config-0.16.5
	pyo3-ffi-0.16.5
	rustversion-1.0.8
	ryu-1.0.10
	serde-1.0.140
	serde_json-1.0.82
	simdutf8-0.1.4
	smallvec-1.9.0
	target-lexicon-0.12.4
	version_check-0.9.4
	wasi-0.11.0+wasi-snapshot-preview1
"

inherit cargo distutils-r1

DISTUTILS_USE_PEP517=maturin
QA_FLAGS_IGNORED=".*"

DESCRIPTION="Fast, correct Python JSON library supporting dataclasses, datetimes, and numpy"
HOMEPAGE="https://github.com/ijl/orjson"

SRC_URI="https://github.com/ijl/orjson/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="|| ( Apache-2.0 MIT )"
KEYWORDS="amd64 arm arm64 x86"
SLOT="0"
IUSE="debug"

RDEPEND="dev-python/flask[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]"
BDEPEND="
	dev-util/maturin[${PYTHON_USEDEP}]
	test? (
		dev-python/arrow[${PYTHON_USEDEP}]
		dev-python/orjson[${PYTHON_USEDEP}]
		dev-python/pendulum[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		$(python_gen_cond_dep 'dev-python/numpy[${PYTHON_USEDEP}]' python3_{8..11})
		$(python_gen_cond_dep '>=dev-python/xxhash-1.4.3[${PYTHON_USEDEP}]' python3_8)
	)"

src_unpack() {
	cargo_src_unpack
}

src_prepare() {
	sed "s/strip = true/strip = false/g" -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest

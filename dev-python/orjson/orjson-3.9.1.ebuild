# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=maturin
CARGO_OPTIONAL=1
CRATES="
	ahash-0.8.3
	android-tzdata-0.1.1
	arrayvec-0.7.2
	associative-cache-1.0.1
	autocfg-1.1.0
	beef-0.5.2
	bytecount-0.6.3
	castaway-0.2.2
	cc-1.0.79
	cfg-if-1.0.0
	chrono-0.4.26
	compact_str-0.7.0
	encoding_rs-0.8.32
	itoa-1.0.6
	itoap-1.0.1
	libc-0.2.144
	libm-0.1.4
	num-traits-0.2.15
	once_cell-1.17.2
	packed_simd_2-0.3.8
	pyo3-build-config-0.19.0
	pyo3-ffi-0.19.0
	rustversion-1.0.12
	ryu-1.0.13
	serde-1.0.163
	serde_json-1.0.96
	simdutf8-0.1.4
	smallvec-1.10.0
	static_assertions-1.1.0
	target-lexicon-0.12.7
	version_check-0.9.4
"

inherit cargo distutils-r1

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

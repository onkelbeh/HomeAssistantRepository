# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 multiprocessing prefix pypi

DESCRIPTION="High-performance RPC framework (python libraries)"
HOMEPAGE="https://grpc.io"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-libs/openssl-1.1.1:0=[-bindist(-)]
	>=dev-libs/re2-0.2021.11.01:=
	>=dev-python/protobuf-python-4.21.6[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	net-dns/c-ares:=
	sys-libs/zlib:=
"

BDEPEND="${RDEPEND}
	>=dev-python/cython-3[${PYTHON_USEDEP}]"

PATCHES=( "${FILESDIR}/cython3-compat.patch" )

python_prepare_all() {
	distutils-r1_python_prepare_all
	hprefixify setup.py
}

python_configure_all() {
	# os.environ.get('GRPC_BUILD_WITH_BORING_SSL_ASM', True)
	export GRPC_BUILD_WITH_BORING_SSL_ASM=
	export GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY=1
	export GRPC_PYTHON_BUILD_SYSTEM_CARES=1
	export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
	export GRPC_PYTHON_BUILD_WITH_SYSTEM_RE2=1
	export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1
	export GRPC_PYTHON_BUILD_WITH_CYTHON=1
	GRPC_PYTHON_BUILD_EXT_COMPILER_JOBS="$(makeopts_jobs)"
	export GRPC_PYTHON_BUILD_EXT_COMPILER_JOBS
}

distutils_enable_tests pytest

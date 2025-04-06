# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1 pypi

DESCRIPTION="easy to use retry decorator in python"
HOMEPAGE="https://github.com/eSAMTrade/retry https://pypi.org/project/retry2/"
SRC_URI="https://github.com/eSAMTrade/retry/archive/refs/tags/${PV}.tar.gz -> retry2-${PV}.tar.gz"

LICENSE="Apache2"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/decorator-3.4.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pbr
		dev-python/pytest
		dev-python/tox
		dev-python/wheel
	)
"
src_unpack() {
	default
	export PBR_VERSION=${PV}
	mv ${WORKDIR}/retry-${PV} ${S}
}
distutils_enable_tests pytest

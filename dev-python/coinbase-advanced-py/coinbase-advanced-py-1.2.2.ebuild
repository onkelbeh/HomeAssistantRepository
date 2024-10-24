# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1
SRC_URI="https://github.com/coinbase/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

DESCRIPTION="Coinbase Advanced API Python SDK"
HOMEPAGE="https://github.com/coinbase/coinbase-advanced-py https://pypi.org/project/coinbase-advanced-py/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-42.0.4[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-12.0[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.2.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/asynctest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	mv ${S}/coinbase ${S}/coinbase-advanced-py
	sed 's/packages=find_packages(exclude=("tests",))/packages=find_packages(exclude=["tests","tests.*"])/g' -i setup.py || die
	eapply "${FILESDIR}"/rename-coinbase.patch
	eapply_user
}

distutils_enable_tests pytest

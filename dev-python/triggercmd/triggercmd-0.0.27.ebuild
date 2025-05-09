# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python agent for TRIGGERcmd cloud service."
HOMEPAGE="https://github.com/rvmey/triggercmd-python-agent https://pypi.org/project/triggercmd/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
	dev-python/websocket-client[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	echo -e '\n[build-system]\nrequires = ["setuptools"]' >> pyproject.toml || die
	echo  "build-backend = \"setuptools.build_meta\"" >> pyproject.toml || die
	default
}

distutils_enable_tests pytest

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Music Assistant Base Models"
HOMEPAGE="https://pypi.org/project/music-assistant-models/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/orjson-3.9[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.14[${PYTHON_USEDEP}]
"

src_prepare() {
	echo -ne '\n[build-system]\nrequires = ["setuptools"]\n' >> pyproject.toml || die
	echo -ne 'build-backend = "setuptools.build_meta"\n' >> pyproject.toml || die
	default
}

distutils_enable_tests pytest

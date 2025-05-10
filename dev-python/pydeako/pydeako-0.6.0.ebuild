# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Connect and interact with deako devices over the network locally"
HOMEPAGE="https://github.com/DeakoLights/pydeako https://pypi.org/project/pydeako/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/zeroconf[${PYTHON_USEDEP}]"

src_prepare() {
	echo -ne '\n[build-system]\nrequires = ["setuptools"]\n' >> pyproject.toml || die
	echo -ne 'build-backend = "setuptools.build_meta"\n' >> pyproject.toml || die
	default
}

distutils_enable_tests pytest

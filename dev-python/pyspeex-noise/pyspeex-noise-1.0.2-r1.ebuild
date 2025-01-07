# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Noise suppression and automatic gain with speex."
HOMEPAGE="https://pypi.org/project/pyspeex-noise/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
        dev-python/pybind11[${PYTHON_USEDEP}]
	"

DOCS="README.md"


distutils_enable_tests pytest

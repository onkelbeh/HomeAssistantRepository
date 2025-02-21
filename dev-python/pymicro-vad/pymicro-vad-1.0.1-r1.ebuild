# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Self-contained voice activity detector"
HOMEPAGE="https://github.com/rhasspy/pymicro-vad"
SRC_URI="https://github.com/rhasspy/pymicro-vad/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/pybind11-2.13.6[${PYTHON_USEDEP}]"

src_unpack() {
	unpack ${A}
	echo ${P}
	mv ${P} pymicro_vad-${PV}
}

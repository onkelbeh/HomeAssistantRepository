# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="pyElectra"
DESCRIPTION="Electra Smart Python Integration."
HOMEPAGE="https://github.com/jafar-atili/pyElectra/ https://pypi.org/project/pyElectra/"
inherit distutils-r1 pypi
SRC_URI="https://github.com/jafar-atili/${PYPI_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PYPI_PN}-${PV}"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"
DOCS="README.md"
RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"
distutils_enable_tests pytest

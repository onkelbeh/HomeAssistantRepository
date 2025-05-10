# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1
MY_PN="system-bridge-models"

DESCRIPTION="System Bridge Models"
HOMEPAGE="https://github.com/timmo001/system-bridge-models https://pypi.org/project/systembridgemodels/"
SRC_URI="https://github.com/timmo001/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/incremental[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

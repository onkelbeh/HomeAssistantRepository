# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1
MY_PN="insteon-panel"
SRC_URI="https://github.com/pyinsteon/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

DESCRIPTION="The Insteon frontend for Home Assistant"
HOMEPAGE="https://github.com/pyinsteon/insteon-panel https://pypi.org/project/insteon-frontend-home-assistant/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
DOCS="README.md"

# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Home Assistant Panel for configuring the LCN integration."
HOMEPAGE="https://github.com/alengwenus/lcn-frontend https://pypi.org/project/lcn-frontend/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND=""

distutils_enable_tests pytest

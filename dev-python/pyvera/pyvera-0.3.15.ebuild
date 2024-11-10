# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python API for talking to Veracontrollers"
HOMEPAGE="https://github.com/pavoni/pyvera https://pypi.org/project/pyvera/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/requests-2.22.0[${PYTHON_USEDEP}]"}

distutils_enable_tests pytest

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Library to control webOS based LG TV devices"
HOMEPAGE="https://github.com/home-assistant-libs/aiowebostv https://pypi.org/project/aiowebostv/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/websockets-10.3[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

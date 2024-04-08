# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A utility for mocking out the Python HTTPX and HTTP Core libraries."
HOMEPAGE="https://github.com/lundberg/respx https://pypi.org/project/respx/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/httpx-0.21.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

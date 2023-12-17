# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Pure python implementation of the adb client"
HOMEPAGE="https://github.com/Swind/pure-python-adb https://pypi.org/project/pure-python-adb/"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" "${PV}.dev0" ".tar.gz")"
S="${WORKDIR}/${P}.dev0"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="async test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="async? ( >=dev-python/aiofiles-0.4.0[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Blockchain API library (v1)"
HOMEPAGE="https://github.com/blockchain/api-v1-client-python/ https://pypi.org/project/blockchain/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/enum-compat[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

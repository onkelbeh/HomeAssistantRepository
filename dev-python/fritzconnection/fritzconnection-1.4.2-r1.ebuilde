# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Communicate with the AVM FRITZ!Box"
HOMEPAGE="https://github.com/kbr/fritzconnection https://pypi.org/project/fritzconnection/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test qrcode"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/requests-2.22.0[${PYTHON_USEDEP}]
	qrcode? ( >=dev-python/segno-1.4.1[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest

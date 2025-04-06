# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Communicate with Dovado router"
HOMEPAGE="https://github.com/molobrakos/dovado https://pypi.org/project/dovado/"

LICENSE="all-rights-reserved"

SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test ) mirror"

RDEPEND="dev-python/netifaces[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="ISO 4217 currency data package for Python"
HOMEPAGE="https://github.com/dahlia/iso4217 https://pypi.org/project/iso4217/"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

distutils_enable_tests pytest

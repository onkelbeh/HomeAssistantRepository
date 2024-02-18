# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A python library for controlling a JVC Projector over a network connection"
HOMEPAGE="https://github.com/SteveEasley/pyjvcprojector https://pypi.org/project/pyjvcprojector/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/dnspython-2.2.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

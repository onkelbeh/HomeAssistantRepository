# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Client BACnet library for Flexit Nordic series of air handling units."
HOMEPAGE="https://github.com/piotrbulinski/flexit_bacnet https://pypi.org/project/flexit-bacnet/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"
distutils_enable_tests pytest

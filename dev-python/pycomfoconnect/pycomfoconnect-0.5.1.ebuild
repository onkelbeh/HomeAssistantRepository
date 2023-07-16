# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1 pypi

DESCRIPTION="Python interface for the Zehnder ComfoConnect LAN C bridge."
HOMEPAGE="https://github.com/michaelarnauts/comfoconnect https://pypi.org/project/pycomfoconnect/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/protobuf-python-3.20.3[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Python library for local control of Rabbit Air air purifiers"
HOMEPAGE="https://github.com/rabbit-air/python-rabbitair https://pypi.org/project/python-rabbitair/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/zeroconf[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYPI_NO_NORMALIZE=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="JSON API to document parser"
HOMEPAGE="
	https://pypi.org/project/json-api-doc/
"

LICENSE="Apache 2.01"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pytest-runner[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

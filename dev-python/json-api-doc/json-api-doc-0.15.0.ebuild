# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYPI_NO_NORMALIZE=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="JSON API to document parser"
HOMEPAGE="https://pypi.org/project/json-api-doc/ https://github.com/julien-duponchelle/json-api-doc"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-python/pytest-runner[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

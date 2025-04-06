# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="Standard library aifc redistribution. 'dead battery'"
HOMEPAGE="
	https://pypi.org/project/standard-aifc/
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/build[${PYTHON_USEDEP}]
	dev-python/twine[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

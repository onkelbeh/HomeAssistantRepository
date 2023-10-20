# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
#DISTUTILS_USE_PEP517=setuptools|poetry
inherit distutils-r1 pypi

DESCRIPTION="controlling gardena bluetooth enabled watering computers"
HOMEPAGE=" https://pypi.org/project/gardena-bluetooth/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
DOCS="README.rst"

RDEPEND=">=dev-python/bleak-0.20.2[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-5.0.1[${PYTHON_USEDEP}]"

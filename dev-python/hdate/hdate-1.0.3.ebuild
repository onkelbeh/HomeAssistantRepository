# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=pdm-backend
inherit distutils-r1 pypi

DESCRIPTION="Jewish/Hebrew date and Zmanim in native Python"
HOMEPAGE="https://github.com/py-libhdate/py-libhdate https://pypi.org/project/hdate/"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test astral"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
	>=dev-python/num2words-0.5.14[${PYTHON_USEDEP}]
	astral? ( >=dev-python/astral-2.2[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

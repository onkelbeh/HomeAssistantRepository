# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="A secure updater framework for Python"
HOMEPAGE="https://theupdateframework.io/ https://github.com/theupdateframework/python-tuf/ https://pypi.org/project/tuf/"

LICENSE="|| ( MIT Apache-2.0 )"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/requests-2.19.1[${PYTHON_USEDEP}]
	~dev-python/securesystemslib-1.0.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

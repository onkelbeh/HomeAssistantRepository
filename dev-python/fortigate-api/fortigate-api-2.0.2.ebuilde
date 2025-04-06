# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python package to configure Fortigate (Fortios) devices using REST API and SSH"
HOMEPAGE="https://github.com/vladimirs-git/fortigate-api https://pypi.org/project/fortigate-api/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/requests-2.28[${PYTHON_USEDEP}]
	>=dev-python/vhelpers-0.1.17[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pydantic[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

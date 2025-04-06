# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Nibe heatpump communication library"
HOMEPAGE="https://github.com/yozik04/nibe https://pypi.org/project/nibe/"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/async-modbus-0.2.2[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/black-22.0.0[${PYTHON_USEDEP}]
	>=dev-python/construct-2.10.0[${PYTHON_USEDEP}]
	>=dev-python/coverage-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/exceptiongroup-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/isort-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.0.5[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.0.0[${PYTHON_USEDEP}]
	dev-vcs/pre-commit
	>=dev-python/python-slugify-4.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Winix C545 Air Purifier Controller."
HOMEPAGE="https://pypi.org/project/winix/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/wheel-0.43.0[${PYTHON_USEDEP}]
	>=dev-python/black-24.4.2-r1[${PYTHON_USEDEP}]
	>=dev-python/twine-5.1.1[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/pytest-runner[${PYTHON_USEDEP}]
	test? (
		  dev-vcs/pre-commit[${PYTHON_USEDEP}]
		  dev-python/pytest[${PYTHON_USEDEP}]
		  dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		  dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

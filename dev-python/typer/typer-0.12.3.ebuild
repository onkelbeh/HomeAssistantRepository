# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=pdm-backend
inherit distutils-r1 pypi

DESCRIPTION="Typer, build great CLIs. Easy to code. Based on Python type hints."
HOMEPAGE="https://github.com/tiangolo/typer https://pypi.org/project/typer/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7.4.3[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

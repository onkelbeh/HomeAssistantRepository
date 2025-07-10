# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="A Python library for working with and comparing language codes"
HOMEPAGE="https://github.com/georgkrause/langcodes https://pypi.org/project/langcodes/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

PYTEST_PLUGINS=()
distutils_enable_tests pytest

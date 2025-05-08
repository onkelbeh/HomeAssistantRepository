# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="Curio is a coroutine-based library for concurrent systems programming."
HOMEPAGE="https://github.com/klen/curio https://pypi.org/project/curio-compat/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

distutils_enable_tests pytest

# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="ReactiveX (Rx) for Python"
HOMEPAGE="https://pypi.org/project/reactivex/ https://github.com/ReactiveX/RxPY"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	>=dev-python/typing-extensions-4.1.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

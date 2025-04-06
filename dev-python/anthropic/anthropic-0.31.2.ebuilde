# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="The official Python library for the anthropic API"
HOMEPAGE="https://github.com/anthropics/anthropic-sdk-python https://pypi.org/project/anthropic/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/httpx-0.23.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.0[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/anyio[${PYTHON_USEDEP}]
	dev-python/distro[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
	sci-libs/tokenizers[${PYTHON_USEDEP}]
	"
	# WIP: dev-python/jiter[${PYTHON_USEDEP}]

distutils_enable_tests pytest

# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Fast and well tested serialization library"
HOMEPAGE="https://github.com/Fatal1ty/mashumaro https://pypi.org/project/mashumaro/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="orjson msgpack test yaml toml"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/typing-extensions-4.1.0[${PYTHON_USEDEP}]
	orjson? ( dev-python/orjson[${PYTHON_USEDEP}] )
	msgpack? ( >=dev-python/msgpack-0.5.6[${PYTHON_USEDEP}] )
	yaml? ( >=dev-python/pyyaml-3.13[${PYTHON_USEDEP}] )
	toml? ( >=dev-python/tomli-1.1.0[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

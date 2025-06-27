# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python library to convert dataclasses into marshmallow schemas."
HOMEPAGE="https://github.com/lovasoa/marshmallow_dataclass https://pypi.org/project/marshmallow-dataclass/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/marshmallow-3.18.0[${PYTHON_USEDEP}]
	>=dev-python/typing-inspect-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/typeguard-4.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

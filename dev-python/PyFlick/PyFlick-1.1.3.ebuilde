# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Python API For Flick Electric in New Zealand"
HOMEPAGE="https://github.com/ZephireNZ/PyFlick https://pypi.org/project/PyFlick/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/aiohttp-3.11.10[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9.0_p0[${PYTHON_USEDEP}]
	>=dev-python/aiohappyeyeballs-2.4.4[${PYTHON_USEDEP}]
	>=dev-python/aiosignal-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/attrs-24.2.0[${PYTHON_USEDEP}]
	>=dev-python/frozenlist-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/idna-3.10[${PYTHON_USEDEP}]
	>=dev-python/json-api-doc-0.15.0[${PYTHON_USEDEP}]
	>=dev-python/multidict-6.1.0[${PYTHON_USEDEP}]
	>=dev-python/propcache-0.2.1[${PYTHON_USEDEP}]
	>=dev-python/six-1.17.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.18.3[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A Python library to communicate with Ring Door Bell (https://ring.com/)"
HOMEPAGE="https://github.com/tchellomello/python-ring-doorbell https://pypi.org/project/ring-doorbell/"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/oauthlib-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2022.0[${PYTHON_USEDEP}]
	dev-python/asyncclick[${PYTHON_USEDEP}]
	dev-python/anyio[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

python_prepare_all() {
	sed -i -e 's:"LICENSE",::' pyproject.toml || die
	sed -i -e 's:"CONTRIBUTING.rst", ::' pyproject.toml || die
	sed -i -e 's:"CHANGELOG.rst",::' pyproject.toml || die
	distutils-r1_python_prepare_all
	}

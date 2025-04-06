# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Library for the Withings API"
HOMEPAGE="https://github.com/vangorra/python_withings_api https://pypi.org/project/withings-api/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/arrow-1.0.3[${PYTHON_USEDEP}]
	>=dev-python/requests-oauth-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-1.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.7.2[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7.4.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/responses[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

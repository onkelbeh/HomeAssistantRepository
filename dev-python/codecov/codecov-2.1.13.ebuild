# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Hosted coverage reports for GitHub, Bitbucket and Gitlab"
HOMEPAGE="https://github.com/codecov/codecov-python https://pypi.org/project/codecov/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/requests-2.7.9[${PYTHON_USEDEP}]
	dev-python/coverage[${PYTHON_USEDEP}]"

python_prepare_all() {
	# The tests does not follow the naming convention
	rm -r "${S}/tests"
	distutils-r1_python_prepare_all
}

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Hosted coverage reports for GitHub, Bitbucket and Gitlab"
HOMEPAGE="https://github.com/codecov/codecov-python https://pypi.org/project/codecov/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS=""

RDEPEND=">=dev-python/requests-2.7.9[${PYTHON_USEDEP}]
	dev-python/coverage[${PYTHON_USEDEP}]"

python_prepare_all() {
	# The tests does not follow the naming convention
	rm -r "${S}/tests"
	distutils-r1_python_prepare_all
	}

#BDEPEND="
#	test? (
#		dev-python/pytest[${PYTHON_USEDEP}]
#		dev-python/ddt[${PYTHON_USEDEP}]
#		dev-python/mock[${PYTHON_USEDEP}]
#		dev-python/pytest-cov[${PYTHON_USEDEP}]
#		dev-python/funcsigs[${PYTHON_USEDEP}]
#		dev-python/requests[${PYTHON_USEDEP}]
#		dev-python/black[${PYTHON_USEDEP}]
#	)"
#
# distutils_enable_tests pytest

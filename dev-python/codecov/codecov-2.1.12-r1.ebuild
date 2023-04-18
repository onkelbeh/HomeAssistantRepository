# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Hosted coverage reports for GitHub, Bitbucket and Gitlab"
HOMEPAGE="https://github.com/codecov/codecov-python https://pypi.org/project/codecov/"
MY_PN="codecov-python"
SRC_URI="https://github.com/codecov/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

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

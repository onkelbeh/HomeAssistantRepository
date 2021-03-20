# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7..8} )

inherit distutils-r1

MY_P=${PN/-/_}-${PV}

DESCRIPTION="Library for the Withings API"
HOMEPAGE="https://github.com/vangorra/python_withings_api https://pypi.org/project/withings-api/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_P}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

S=${WORKDIR}/${MY_P}

DOCS="README.md"

RDEPEND=">=dev-python/arrow-1.0.3[${PYTHON_USEDEP}]
	>=dev-python/requests-oauth-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-1.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.7.2[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7.4.2[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

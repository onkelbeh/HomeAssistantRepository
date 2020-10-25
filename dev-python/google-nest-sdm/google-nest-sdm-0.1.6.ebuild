# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Library for the Google Nest SDM API"
HOMEPAGE="https://github.com/allenporter/python-google-nest-sdm https://pypi.org/project/google-nest-sdm/"
SRC_URI="https://github.com/allenporter/python-${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/python-${PN}-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS="README.md"

RDEPEND="~dev-python/aiohttp-3.6.2[${PYTHON_USEDEP}]
	~dev-python/google-auth-1.22.0[${PYTHON_USEDEP}]
	~dev-python/google-auth-oauthlib-0.4.1[${PYTHON_USEDEP}]
	~dev-python/google-cloud-pubsub-2.1.0[${PYTHON_USEDEP}]
	~dev-python/requests-oauthlib-1.3.0[${PYTHON_USEDEP}]"
BDEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

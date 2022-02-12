# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Google Cloud Pub/Sub API client library"
HOMEPAGE="https://github.com/googleapis/python-pubsub https://pypi.org/project/google-cloud-pubsub/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS="README.rst"

RDEPEND=">=dev-python/google-api-core-1.22.2[${PYTHON_USEDEP}]
	>=dev-python/libcst-0.3.10[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.7.1[${PYTHON_USEDEP}]
	>=dev-python/grpc-google-iam-v1-0.12.3[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

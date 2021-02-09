# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="Library for controlling an Apple TV"
HOMEPAGE="https://github.com/postlund/pyatv https://pypi.org/project/pyatv/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz
	https://raw.githubusercontent.com/postlund/pyatv/v0.7.4/base_versions.txt"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.6[${PYTHON_USEDEP}]
	>=dev-python/netifaces-0.10.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-python-3.6.0[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.28.0[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)"

src_prepare() {
	cp ${DISTDIR}/base_versions.txt ${S} || die
	sed 's/packages=find_packages(exclude=\[\"tests\", \"tests.\*\"\])/packages=find_packages(exclude=["tests", "tests.*", "examples"])/g' -i setup.py || die
	eapply_user
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

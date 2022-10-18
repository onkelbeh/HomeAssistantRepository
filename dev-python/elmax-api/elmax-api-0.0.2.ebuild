# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Asynchronous API Library to work with Elmax devices"
HOMEPAGE="https://github.com/albertogeniola/elmax-api https://pypi.org/project/elmax-api/"
MY_PN=${PN/-/_}
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/pyjwt-1.7.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.18.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.6.3[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

# prevent writing a useless file to /usr
src_prepare() {
	sed "s/data_files=\[('.', \['requirements.txt'\])\],/# data_files=\[('.', \['requirements.txt'\])\],/g" -i setup.py || die
	eapply_user
}

distutils_enable_tests pytest

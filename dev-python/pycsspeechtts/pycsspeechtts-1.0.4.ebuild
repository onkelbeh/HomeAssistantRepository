# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Python 3 interface to Microsoft Cognitive Services Text To Speech"
HOMEPAGE="https://github.com/jeroenterheerdt/pycsspeechtts https://pypi.org/project/pycsspeechtts/"
# PYPI SDIST IS IMCOMPLETE
COMMITID="44049cb2e1f173eed9d58e61ab97a8b4d40b5e0a"
SRC_URI="https://github.com/jeroenterheerdt/pycsspeechtts/archive/${COMMITID}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${COMMITID}/src/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

#DOCS="README.md"

RDEPEND=">=dev-python/requests-2.0[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

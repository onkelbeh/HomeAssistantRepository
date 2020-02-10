# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1 git-r3

DESCRIPTION="eQ-3/ELV MAX! Cube Python API"
HOMEPAGE="https://github.com/goodfield/python-maxcube-api.git https://pypi.org/project/maxcube-api/"
#SRC_URI="https://github.com/hackercowboy/python-maxcube-api/archive/v0.1.0.tar.gz"
EGIT_REPO_URI="https://github.com/hackercowboy/python-maxcube-api.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

MY_PN="maxcube"

RDEPEND=""
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

#S="${WORKDIR}/python-${P}"
PYTHON_MODULES="${MY_PN}"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

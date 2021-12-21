# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1 git-r3

DESCRIPTION="eQ-3/ELV MAX! Cube Python API"
HOMEPAGE="https://github.com/goodfield/python-maxcube-api.git https://pypi.org/project/maxcube-api/"
EGIT_COMMIT="2e257a3"
EGIT_REPO_URI="https://github.com/hackercowboy/python-maxcube-api.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 x86 amd64-linux x86-linux"
IUSE="test"

DOCS="README.rst"

RDEPEND=""
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

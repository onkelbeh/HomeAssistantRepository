# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="A library to get and set values of the EZcontrol XS1 Gateway"
HOMEPAGE="https://github.com/markusressel/xs1-api-client https://pypi.org/project/xs1-api-client/"

# Pypi Archive is missing (needed) 'requirements.txt'
# MY_PN=${PN//-/_}
# MY_P=${MY_PN}-${PV}
# SRC_URI="mirror://pypi/${P:0:1}/${MY_PN}/${MY_P}.tar.gz -> ${P}.tar.gz"
# S=${WORKDIR}/${MY_PN}-${PV}
#
# we take it from github:
SRC_URI="https://github.com/markusressel/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {

	# weird: setup.py tries to get branch name from (non-existant) git
	# subprocess.check_output(["git", "rev-parse", "--abbrev-ref", "HEAD"])
	sed -i "s/subprocess.check_output(\[\"git\", \"rev-parse\", \"--abbrev-ref\", \"HEAD\"\])/'master'/" -i setup.py || die
	sed -i "s/GIT_BRANCH = GIT_BRANCH.decode()  //" -i setup.py || die

	# and it tries to install a 'tests' package at top level.... tsss...
	sed -i "s/packages=find_packages()/packages=find_packages(exclude=['tests','tests.*'])/g" -i setup.py || die

	# let's call this a 'triple'
	eapply_user

}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1 git-r3

DESCRIPTION="Pusher websocket client for python, based on Erik Kulyk's PythonPusherClient"
HOMEPAGE="https://github.com/nlsdfnbch/Pysher https://pypi.org/project/Pysher/"
EGIT_REPO_URI="https://github.com/deepbrook/Pysher.git"
EGIT_COMMIT="f73f8e5cf6f2556925030bf924e6adf9beef7943"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS="README.md"

RDEPEND=">=dev-python/websocket-client-0.48.0[${PYTHON_USEDEP}]"
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

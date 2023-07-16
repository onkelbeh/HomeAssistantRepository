# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="a library to communicate with Mycroft API"
HOMEPAGE="https://github.com/StuartJMackintosh/mycroftapi https://pypi.org/project/mycroftapi/"

LICENSE="all-rights-reserved"
RESTRICT="mirror"

SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

#DOCS="README.md"

RDEPEND="dev-python/websocket-client[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

src_prepare() {
	sed -i "s/websocket-client==0.44.0/websocket-client/g" -i setup.py || die
	eapply_user
	}

distutils_enable_tests pytest

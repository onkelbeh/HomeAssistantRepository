# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="wrapper around different bluetooth low energy backends"
HOMEPAGE="https://github.com/ChristianKuehnel/btlewrap https://pypi.org/project/btlewrap/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"
RDEPEND="
	dev-python/bluepy[${PYTHON_USEDEP}]
	dev-python/pygatt[${PYTHON_USEDEP}]
"
DOCS="README.rst"

src_prepare() {
	sed -i "s/packages=find_packages()/packages=find_packages(exclude=['test','test.*'])/g" -i setup.py || die
	eapply_user
}

distutils_enable_tests pytest

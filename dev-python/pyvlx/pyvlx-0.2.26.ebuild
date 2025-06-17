# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="Enables you to run scenes and or open and close VELUX windows via KLF200"
HOMEPAGE="https://github.com/xavierforestier/pyvlx"
#https://github.com/Julius2342/pyvlx https://pypi.org/project/pyvlx/"
EGIT_REPO_URI="https://github.com/xavierforestier/pyvlx.git"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/pyyaml[${PYTHON_USEDEP}]"

src_prepare() {
	sed -i "s/packages=find_packages()/packages=find_packages(exclude=['test*'])/g" -i setup.py || die
	eapply_user
}

distutils_enable_tests pytest

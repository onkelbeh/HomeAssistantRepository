# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="PyVLX is a wrapper for the Velux KLF 200 API. PyVLX enables you to run scenes and or open and close velux windows."
HOMEPAGE="https://github.com/Julius2342/pyvlx https://pypi.org/project/pyvlx/"

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

# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="A library to send rc signals with the RaspyRFM module"
HOMEPAGE="https://github.com/markusressel/raspyrfm-client https://pypi.org/project/raspyrfm-client/"
SRC_URI="https://github.com/markusressel/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"


src_prepare() {
	sed -i "s/packages=find_packages()/packages=find_packages(exclude=['tests'])/g" -i setup.py || die
	eapply "${FILESDIR}/${PN}_catch_git_queries.patch"
	eapply_user
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

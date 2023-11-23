# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
MY_PN=${PN/-/_}
DESCRIPTION="Discover and control ANEL NET-PwrCtrl devices."
HOMEPAGE="https://pypi.org/project/anel-pwrctrl-homeassistant/"
SRC_URI="https://files.pythonhosted.org/packages/source/${P:0:1}/${PN}/${MY_PN}-${PV}.dev2.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S="${WORKDIR}/${MY_PN}-${PV}.dev2"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

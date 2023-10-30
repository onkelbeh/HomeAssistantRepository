# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="A smart propane tank monitor."
HOMEPAGE="https://github.com/krismolendyke/tank-utility https://pypi.org/project/tank-utility/"
MY_PN=${PN/-/_}
SRC_URI="https://github.com/krismolendyke/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/requests-2.0[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

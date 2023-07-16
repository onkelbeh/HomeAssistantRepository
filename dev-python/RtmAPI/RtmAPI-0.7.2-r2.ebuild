# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
DESCRIPTION="API package for rememberthemilk.com"
HOMEPAGE="https://bitbucket.org/rtmapi/rtmapi https://pypi.org/project/RtmAPI/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README"

RDEPEND=">=dev-python/httplib2-0.6.0[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

PATCHES=( "${FILESDIR}/RtmAPI-0.7.2-2to3.patch" )

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

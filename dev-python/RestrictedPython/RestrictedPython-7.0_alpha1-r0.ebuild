# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1
MY_PV1=${PV/_beta/b}
MY_PV=${MY_PV1/_alpha/a}

DESCRIPTION="subset of Python which allows program input into a trusted environment."
HOMEPAGE="https://github.com/zopefoundation/RestrictedPython https://pypi.python.org/pypi/RestrictedPython https://pypi.org/project/RestrictedPython/"
SRC_URI="https://github.com/zopefoundation/${PN}/archive/refs/tags/${MY_PV}.dev${PR: -1}.tar.gz -> ${P}.dev${PR: -1}.gh.tar.gz"
S=${WORKDIR}/${PN}-${MY_PV}.dev${PR: -1}

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

DEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)"

PYTHON_MODULES="${PN}"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

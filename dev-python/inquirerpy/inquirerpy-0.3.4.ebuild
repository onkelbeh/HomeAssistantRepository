# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1

DESCRIPTION="Python port of Inquirer.js (A collection of common interactive command-line user interfaces)"
HOMEPAGE="https://github.com/kazhala/InquirerPy https://pypi.org/project/inquirerpy/"
MY_PN="InquirerPy"
SRC_URI="https://github.com/kazhala/InquirerPy/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S=${WORKDIR}/${MY_PN}-${PV}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/prompt-toolkit[${PYTHON_USEDEP}]
	dev-python/pfzy[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

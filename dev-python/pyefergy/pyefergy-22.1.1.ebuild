# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="An API library for Efergy energy meters."
HOMEPAGE="https://github.com/tkdrob/pyefergy https://pypi.org/project/pyefergy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.4.4[${PYTHON_USEDEP}]
	>=dev-python/iso4217-1.2.20150619[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

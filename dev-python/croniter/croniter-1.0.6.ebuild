# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="croniter provides iteration for datetime object with cron like format"
HOMEPAGE="https://github.com/kiorky/croniter https://pypi.org/project/croniter/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/natsort[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		dev-python/tzlocal[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
	py.test -v src/croniter/tests || die "tests failed"
}

distutils_enable_tests pytest

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="PyFlume"
inherit distutils-r1 pypi
DESCRIPTION="Package to integrate with Flume Sensor"
HOMEPAGE="https://github.com/ChrisMandich/PyFlume https://pypi.org/project/PyFlume/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"
PATCHES="${FILESDIR}/${PN}-fix-setup-py.patch"
DOCS="README.md"

RDEPEND="dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]
	dev-python/ratelimit[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

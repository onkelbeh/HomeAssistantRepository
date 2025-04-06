# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="HTTP/2 Client for Python"
HOMEPAGE="https://hyper.rtfd.org https://pypi.org/project/hyper/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/h2[${PYTHON_USEDEP}]
	dev-python/hyperframe[${PYTHON_USEDEP}]
	dev-python/rfc3986[${PYTHON_USEDEP}]
	app-arch/brotli[python]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

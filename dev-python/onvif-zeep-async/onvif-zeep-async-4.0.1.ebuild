# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Async Python Client for ONVIF Camera"
HOMEPAGE="https://github.com/hunterjm/python-onvif-zeep-async https://pypi.org/project/onvif-zeep-async/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
	>=dev-python/aiohttp-3.12.9[${PYTHON_USEDEP}]
	>=dev-python/ciso8601-2.3.2[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/zeep-4.3.1[async,${PYTHON_USEDEP}]
	>=dev-python/yarl-1.20.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

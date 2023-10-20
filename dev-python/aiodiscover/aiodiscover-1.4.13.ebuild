# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Discover hosts by arp and ptr lookup"
HOMEPAGE="https://github.com/bdraco/aiodiscover https://pypi.org/project/aiodiscover/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/async-timeout-4.0.1[${PYTHON_USEDEP}]
	>=dev-python/netifaces-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/dnspython-2.1.0[${PYTHON_USEDEP}]
	dev-python/ifaddr[${PYTHON_USEDEP}]
	>=dev-python/pyroute2-0.6.9[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/pytest-runner[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest

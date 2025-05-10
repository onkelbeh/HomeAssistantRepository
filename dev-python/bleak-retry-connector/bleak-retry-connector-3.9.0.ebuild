# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A connector for Bleak Clients that handles transient connection failures"
HOMEPAGE="https://github.com/bluetooth-devices/bleak-retry-connector https://pypi.org/project/bleak-retry-connector/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/bleak-0.22.3[${PYTHON_USEDEP}]
	>=dev-python/dbus-fast-2.32.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-adapters-0.21.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest

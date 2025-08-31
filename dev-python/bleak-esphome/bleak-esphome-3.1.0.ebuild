# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3_11 python3_{11..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Bleak backend of ESPHome"
HOMEPAGE="https://github.com/bluetooth-devices/bleak-esphome https://pypi.org/project/bleak-esphome/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aioesphomeapi-30.1.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-1.18.0[${PYTHON_USEDEP}]
	>=dev-python/habluetooth-5.2.0[${PYTHON_USEDEP}]
	>=dev-python/lru-dict-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-3.8.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asynciocov[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/zeroconf[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
